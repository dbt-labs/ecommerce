-- to exclude extraneous intermediary columns from orders_calculations

{{
    config(
        materialized='table',
        sort='created_at',
        dist='order_id'
    )
}}

select
{{
    dbt_utils.star(from=ref('orders_calculations'),
    except=[
    "FIRST_COMPLETED_ORDER_DATE_CALC",
    "PREVIOUS_COMPLETED_ORDER_DATE_CALC",
    "LIFETIME_COMPLETED_ORDERS_CALC",
    "LIFETIME_REVENUE_CALC",
    "first_completed_order_date_calc",
    "previous_completed_order_date_calc",
    "lifetime_completed_orders_calc",
    "lifetime_revenue_calc"
           ]
    )
}}

from {{ref('orders_calculations')}}
