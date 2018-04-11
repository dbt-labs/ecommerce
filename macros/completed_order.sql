{% macro completed_order(column_name, vals = []) %}

    {% set vals = [] %}
--    {% for val in vals %}
    case when {{column_name}} in vals
        then 1
        else 0
    end as completed_order
--    {% endfor %}

{% endmacro %}
