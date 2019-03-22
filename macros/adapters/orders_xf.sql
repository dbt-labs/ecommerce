{% macro orders_xf() %}

    {{ adapter_macro('fishtown_analytics_ecommerce.orders_calculations') }}

{% endmacro %}

{% macro default__orders_calculations() %}
select
{{
    dbt_utils.star(from=ref('orders_calculations'),
    except=["previous_completed_order_calc"])
}}

from {{ref('orders_calculations')}}
{% endmacro %}

{% macro bigquery__orders_calculations() %}

-- to exclude extraneous intermediary columns from orders_calculations

{{config(materialized='table')}}

select * except (
    
    first_completed_order_timestamp_calc,
    previous_completed_order_timestamp_calc,
    lifetime_completed_orders_calc,
    lifetime_revenue_calc
)

from {{ref('ORDERS_CALCULATIONS')}}
{% endmacro %}
