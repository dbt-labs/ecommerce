-- to exclude extraneous intermediary columns from orders_calculations

{{config(materialized='table')}}

select * except (
    
    first_completed_order_timestamp_calc, 
    previous_completed_order_timestamp_calc,
    lifetime_completed_orders_calc,
    lifetime_revenue_calc
)

from {{ref('ORDERS_CALCULATIONS')}}
