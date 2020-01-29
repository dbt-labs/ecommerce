
{% set order_seq_number -%}
  row_number() over (partition by {{ var('customer_aggregate_on') }} order by created_at)
{%- endset %}

{% set frame_clause -%}
  over (
    partition by {{ var('customer_aggregate_on') }}
    order by created_at rows between unbounded preceding and unbounded following
  )
{%- endset %}

{% set window -%}
  over (partition by {{ var('customer_aggregate_on') }})
{%- endset %}

with orders as (

    select * from {{ var('orders_table') }}
    
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
        
        cast(created_at as date) as created_date,

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
            when completed_order_number = 1 then 'new'
            when completed_order_number is not null then 'repeat'
            else null
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
        
        sum(coalesce(total_price, 0)) {{frame_clause}} as lifetime_revenue,
        
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
--look to previous_completed_order_date to view differing adapter logic

    select

        *,

        case
            when created_at <= first_completed_order_date then null
            else coalesce(previous_completed_order_calc,
            {{ previous_completed_order_date() }})
        end as previous_completed_order_date

    from calculation_1

),

date_diffs as (

    select

        *,

        case
            when created_at < first_completed_order_date then null
            else {{ dbt_utils.datediff(
                'first_completed_order_date',
                'created_at',
                'month') }}
        end as months_from_first_completed_order,

        case
            when created_at < first_completed_order_date then null
            else{{ dbt_utils.datediff(
                'first_completed_order_date',
                'created_at',
                'week') }}
        end as weeks_from_first_completed_order,

        case
            when created_at < first_completed_order_date then null
            else {{ dbt_utils.datediff(
                'first_completed_order_date',
                'created_at',
                'day') }}
        end as days_from_first_completed_order,

        case
            when created_at <= first_completed_order_date then null
            else {{ dbt_utils.datediff(
                'previous_completed_order_date',
                'created_at',
                'day') }}
        end as days_since_previous_completed_order,

        case
            when created_at < first_completed_order_date then null
            else {{ dbt_utils.datediff(
                'first_completed_order_date',
                'current_date',
                'day') }}
        end as customer_age_days

    from calculation_2
    
),

final_calculations as (

    {% set days = 

        var('days')
    
    %}

    select

        *,

        case when lifetime_completed_orders = 1 then 'single_purchaser'
            when lifetime_completed_orders > 1 then 'repeat_purchaser'
            else 'non_purchaser'
        end as customer_type,

        {{ first_window_values ( days = days ) }}

    from date_diffs
    
)

select * from final_calculations
