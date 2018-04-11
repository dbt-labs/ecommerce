
{% set order_seq_number = "row_number() over (partition by email order by created_at)" %}

with orders as (

    select * from {{var('orders_table')}}
),

fields as (

    select

        *,

        split_part(created_at, '-' , 1) as order_year,
        split_part(split_part(created_at, '-' , 2),'-',1) as order_month,
        split_part(split_part(created_at, ' ' , 1),'-',3) as order_day_of_month,

        case
            when {{ order_seq_number }} = 1
                then 'new'
            else 'repeat'
        end as new_vs_repeat,

        case
            when cancelled_at is not null
                then true
            else false
        end as cancelled

    from orders
),

order_numbers as (

    select

        *,

        {{ order_seq_number }} as order_seq_number,

        case
            when is_completed = 1
                then row_number() over (
                    partition by email, is_completed
                    order by created_at)
            else null
        end as completed_order_number

    from fields
),

--the general idea for the next 2 CTEs is:
--calculation_1 calculates fields using case when, null if order_completed = 0,
--calculation_2 calculates values where is_completed = 0 using coalesce

calculation_1 as (

    select

        *,

        case
            when is_completed = 1
                then min(created_at) over (
                    partition by email, is_completed order by created_at
                    rows between unbounded preceding and unbounded following)
            else null
        end as first_completed_order_date_calc,

        case
            when completed_order_number > 1 then lag(created_at, 1) over (
                partition by email, is_completed order by created_at)
            when completed_order_number = 1 then null
            else null
        end as previous_completed_order_date_calc,

        case
            when is_completed = 1 then count(*) over (
                partition by email, is_completed)
                else null
        end as lifetime_completed_orders_calc,

        case
            when is_completed = 1 then sum(total_price) over (
                partition by email, is_completed)
                else null
        end as lifetime_revenue_calc

    from order_numbers

),

calculation_2 as (

    select

        *,
        -- first_order_date and lifetime_placed_orders calculated using all
            -- orders, regardless of whether order was completed or not.
        -- Other fields in this CTE are for completed orders only.

        min(created_at) over
            (partition by email
                order by created_at
                    rows between unbounded preceding and unbounded following)
        as first_order_date,

        coalesce(first_completed_order_date_calc,
            max(first_completed_order_date_calc) over (
                partition by email order by created_at
                rows between unbounded preceding and unbounded following))
        as first_completed_order_date,

        count(*) over (partition by email)
            as lifetime_placed_orders,

        coalesce(lifetime_completed_orders_calc,
            max(lifetime_completed_orders_calc) over (
                partition by email), 0)
            as lifetime_completed_orders,

        coalesce(lifetime_revenue_calc,
            max(lifetime_revenue_calc) over (
                partition by email), 0)
            as lifetime_revenue,

        case
            when created_at <= first_completed_order_date_calc then null
            else coalesce(previous_completed_order_date_calc,
                lag(previous_completed_order_date_calc, 1) ignore nulls over (
                partition by email order by created_at desc))
        end as previous_completed_order_date

    from calculation_1
),

date_diffs as (

    select

        *,

        case
            when created_at < first_completed_order_date then null
            else datediff(month, first_completed_order_date, created_at)
        end as months_from_first_completed_order,

        case
            when created_at < first_completed_order_date then null
            else datediff(week, first_completed_order_date, created_at)
        end as weeks_from_first_completed_order,

        case
            when created_at < first_completed_order_date then null
            else datediff(day, first_completed_order_date, created_at)
        end as days_from_first_completed_order,

        case
            when created_at <= first_completed_order_date then null
            else datediff(day, previous_completed_order_date, created_at)
        end as days_since_previous_completed_order,

        case
            when created_at < first_completed_order_date then null
            else datediff(day, first_completed_order_date, current_date)
        end as customer_age_days

    from calculation_2
),

final_calculations as (

    select

        *,

        case when lifetime_completed_orders = 1 then 'single_purchaser'
            when lifetime_completed_orders > 1 then 'repeat_purchaser'
            else 'non_purchaser'
        end as customer_type,

        sum(case
                when days_from_first_completed_order <= 30
                    and is_completed = 1 then 1
                else 0
            end) over(
                    partition by email order by created_at
                    rows between unbounded preceding and unbounded following)
        as customer_first_30_day_completed_orders,

        sum(case
                when days_from_first_completed_order <= 30 and is_completed = 1
                    then total_price
                else 0
            end) over(
                    partition by email order by created_at
                    rows between unbounded preceding and unbounded following)
        as customer_first_30_day_revenue,

        sum(case
                when days_from_first_completed_order <= 60 and is_completed = 1
                    then 1
                else 0
            end) over (
                    partition by email order by created_at
                    rows between unbounded preceding and unbounded following)
        as customer_first_60_day_completed_orders,

        sum(case
                when days_from_first_completed_order <= 60 and is_completed = 1
                    then total_price
                 else 0 end) over(
                     partition by email order by created_at
                     rows between unbounded preceding and unbounded following)
        as customer_first_60_day_revenue,

        sum(case
                when days_from_first_completed_order <= 90 and is_completed = 1
                    then 1
                else 0
            end) over
                    (partition by email order by created_at
                    rows between unbounded preceding and unbounded following)
        as customer_first_90_day_completed_orders,

        sum(case
                when days_from_first_completed_order <= 90 and is_completed = 1
                    then total_price
                else 0
            end) over (
                    partition by email order by created_at
                    rows between unbounded preceding and unbounded following)
        as customer_first_90_day_revenue

    from date_diffs
)

select * from final_calculations
