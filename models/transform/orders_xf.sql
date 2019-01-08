-- to exclude extraneous intermediary columns from orders_calculations

{{
    config(
        materialized='table'
    )
}}

select
{{
    dbt_utils.star(from=ref('orders_calculations'),
    except=["previous_completed_order_calc"])
}}

from {{ref('orders_calculations')}}
