--this window function varies between default vs BQ and can be found in
--the orders_calculations model

{% macro previous_completed_order_date() %}

    {{ adapter_macro('fishtown_analytics_ecommerce.previous_completed_order_date') }}

{% endmacro %}

{% macro bigquery__previous_completed_order_date() %}

        last_value(previous_completed_order_calc ignore nulls) over (
            partition by {{var('customer_aggregate_on')}}
            order by created_at
                rows between unbounded preceding
                and 1 preceding)

{% endmacro %}

{% macro default__previous_completed_order_date() %}

        lead(previous_completed_order_calc, 1) {{ignore_nulls}}  over (
            partition by {{var('customer_aggregate_on')}} order by created_at)

{% endmacro %}
