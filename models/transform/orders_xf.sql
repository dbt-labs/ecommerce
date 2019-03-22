-- to exclude extraneous intermediary columns from orders_calculations

{{
    config(
        materialized='table',
        sort='created_at',
        dist='order_id'
    )
}}


{{ orders_xf() }}
