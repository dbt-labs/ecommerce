{% macro orders_calculations() %}

    {{ adapter_macro('fishtown_analytics_ecommerce.orders_calculations') }}

{% endmacro %}


{% macro default__orders_calculations() %}


{% set order_seq_number = "row_number() over (partition by
    {{var('customer_aggregate_on')}} order by created_at)" %}

{% set frame_clause = "over (partition by {{var('customer_aggregate_on')}} order
by created_at rows between unbounded preceding and unbounded following)" %}

{% set window = "over (partition by {{var('customer_aggregate_on')}})" %}

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
            when cancelled_at is not null
                then true
            else false
        end as is_cancelled,

        --order numbers

        {{ order_seq_number }} as order_seq_number,
        
        case
            when is_completed = 1
                then row_number() over (
                    partition by {{var('customer_aggregate_on')}}, is_completed
                    order by created_at)
            else null
        end as completed_order_number

    from orders
    
),

order_numbers as (

    select

        *,
        
        case
            when completed_order_number = 1
                then 'new'
            else 'repeat'
        end as new_vs_repeat

    from fields
),

calculation_1 as (

--this CTE calculates values for a given user either for total values or
--for completed values only

    select

        *,
        
        --total values
        
        min(cast(created_at as timestamp)) {{window}} as first_order_date,
        
        count(*) over (partition by {{var('customer_aggregate_on')}})
            as lifetime_placed_orders,
        
        sum(total_price) {{frame_clause}} as lifetime_revenue,
        
        --completed order values

        min(case when is_completed = 1 then created_at else null end)
            {{window}} as first_completed_order_date,

        sum(case when is_completed = 1 then 1 else 0 end)
            {{frame_clause}} as lifetime_completed_orders,

        sum(case when is_completed = 1 then total_price else 0 end)
            {{frame_clause}} as lifetime_completed_revenue,
        
        --this creates a field needed to achieve the final value in the next CTE
        
        lag(created_at) over (partition by {{var('customer_aggregate_on')}},
            is_completed order by created_at) as previous_completed_order_calc

    from order_numbers

),

calculation_2 as (

--filling in lagged rows for previous completed order date for non complete orders

    select

        *,

        case
            when created_at <= first_completed_order_date then null
            else coalesce(previous_completed_order_calc,
            lead(previous_completed_order_calc, 1) ignore nulls over (
                partition by {{var('customer_aggregate_on')}} order by created_at))
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

        sum(case when days_from_first_completed_order <= 30 and is_completed = 1
            then 1 else 0 end)
            {{ frame_clause }}
            as customer_first_30_day_completed_orders,

        sum(case when days_from_first_completed_order <= 30 and is_completed = 1
            then total_price else 0 end)
            {{ frame_clause }}
        as customer_first_30_day_revenue,

        sum(case when days_from_first_completed_order <= 60 and is_completed = 1
            then 1 else 0 end)
            {{ frame_clause }}
            as customer_first_60_day_completed_orders,

        sum(case when days_from_first_completed_order <= 60 and is_completed = 1
            then total_price else 0 end)
            {{ frame_clause }}
            as customer_first_60_day_revenue,

        sum(case when days_from_first_completed_order <= 90 and is_completed = 1
            then 1 else 0 end)
            {{ frame_clause }}
            as customer_first_90_day_completed_orders,

        sum(case when days_from_first_completed_order <= 90 and is_completed = 1
            then total_price else 0 end)
            {{ frame_clause }}
            as customer_first_90_day_revenue

    from date_diffs
    
)

select * from final_calculations


{% endmacro %}






{% macro bigquery__orders_calculations() %}


{% set order_seq_number = "row_number() over (partition by
    {{var('customer_aggregate_on')}} order by created_at)" %}

{% set frame_clause = "over (partition by {{var('customer_aggregate_on')}} order
by created_at rows between unbounded preceding and unbounded following)" %}

{% set window = "over (partition by {{var('customer_aggregate_on')}})" %}

with orders as (

    select * from {{var('orders_table')}}
    
),

fields as (

    select

        *,

        extract(year from created_at) as order_year,
        extract(month from created_at) as order_month,
        extract(day from created_at) as order_day_of_month,
        
        case
            when cancelled_at is not null
                then true
            else false
        end as is_cancelled,

        --order numbers

        {{ order_seq_number }} as order_seq_number,
        
        case
            when is_completed = 1
                then row_number() over (
                    partition by {{var('customer_aggregate_on')}}, is_completed
                    order by created_at)
            else null
        end as completed_order_number

    from orders
    
),

order_numbers as (

    select

        *,
        
        case
            when completed_order_number = 1
                then 'new'
            else 'repeat'
        end as new_vs_repeat

    from fields
),

calculation_1 as (

--this CTE calculates values for a given user either for total values or
--for completed values only

    select

        *,
        
        --total values
        
        min(cast(created_at as timestamp)) {{window}} as first_order_date,
        
        count(*) over (partition by {{var('customer_aggregate_on')}})
            as lifetime_placed_orders,
        
        sum(total_price) {{frame_clause}} as lifetime_revenue,
        
        --completed order values

        min(case when is_completed = 1 then created_at else null end)
            {{window}} as first_completed_order_date,

        sum(case when is_completed = 1 then 1 else 0 end)
            {{frame_clause}} as lifetime_completed_orders,

        sum(case when is_completed = 1 then total_price else 0 end)
            {{frame_clause}} as lifetime_completed_revenue,
        
        --this creates a field needed to achieve the final value in the next CTE
        
        lag(created_at) over (partition by {{var('customer_aggregate_on')}},
            is_completed order by created_at) as previous_completed_order_calc

    from order_numbers

),

calculation_2 as (

--filling in lagged rows for previous completed order date for non complete orders

    select

        *,

        case
            when created_at <= first_completed_order_date then null
            else coalesce(previous_completed_order_calc,
            lead(previous_completed_order_calc) over (
                partition by {{var('customer_aggregate_on')}} order by created_at))
        end as previous_completed_order_date

    from calculation_1

),

date_diffs as (

    select

        *,

        case
            when created_at < first_completed_order_date then null
            else date_diff(date(first_completed_order_date), date(created_at), month)
        end as months_from_first_completed_order,

        case
            when created_at < first_completed_order_date then null
            else date_diff(date(first_completed_order_date), date(created_at), week)
        end as weeks_from_first_completed_order,

        case
            when created_at < first_completed_order_date then null
            else date_diff(date(first_completed_order_date), date(created_at), day)
        end as days_from_first_completed_order,

        case
            when created_at <= first_completed_order_date then null
            else date_diff(date(previous_completed_order_date), date(created_at), day)
        end as days_since_previous_completed_order,

        case
            when created_at < first_completed_order_date then null
            else date_diff(date(first_completed_order_date), current_date, day)
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

        sum(case when days_from_first_completed_order <= 30 and is_completed = 1
            then 1 else 0 end)
            {{ frame_clause }}
            as customer_first_30_day_completed_orders,

        sum(case when days_from_first_completed_order <= 30 and is_completed = 1
            then total_price else 0 end)
            {{ frame_clause }}
        as customer_first_30_day_revenue,

        sum(case when days_from_first_completed_order <= 60 and is_completed = 1
            then 1 else 0 end)
            {{ frame_clause }}
            as customer_first_60_day_completed_orders,

        sum(case when days_from_first_completed_order <= 60 and is_completed = 1
            then total_price else 0 end)
            {{ frame_clause }}
            as customer_first_60_day_revenue,

        sum(case when days_from_first_completed_order <= 90 and is_completed = 1
            then 1 else 0 end)
            {{ frame_clause }}
            as customer_first_90_day_completed_orders,

        sum(case when days_from_first_completed_order <= 90 and is_completed = 1
            then total_price else 0 end)
            {{ frame_clause }}
            as customer_first_90_day_revenue

    from date_diffs
    
)

select * from final_calculations


{% endmacro %}
