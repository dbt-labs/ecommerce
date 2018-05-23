-- to exclude extraneous intermediary columns from orders_calculations

{{config(materialized='table')}}

select
{{
    dbt_utils.star(from=ref('ORDERS_CALCULATIONS'),
    except=[
    "FIRST_COMPLETED_ORDER_TIMESTAMP_CALC",
    "PREVIOUS_COMPLETED_ORDER_TIMESTAMP_CALC",
    "LIFETIME_COMPLETED_ORDERS_CALC",
    "LIFETIME_REVENUE_CALC",
    "first_completed_order_timestamp_calc",
    "previous_completed_order_timestamp_calc",
    "lifetime_completed_orders_calc",
    "lifetime_revenue_calc"
           ]
    )
}}

from {{ref('ORDERS_CALCULATIONS')}}
