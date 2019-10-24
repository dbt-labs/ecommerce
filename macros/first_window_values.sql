{% macro first_window_values(days) %}

    {% for day in days %}
    

        sum(case when days_from_first_completed_order <= {{ day }} 
            and is_completed = 1
            then 1 else 0 end)
            over (partition by {{var('customer_aggregate_on')}} 
            order by created_at rows between unbounded preceding and unbounded following)
            as customer_first_{{ day }}_day_completed_orders,

        sum(case when days_from_first_completed_order <= {{ day }} 
            and is_completed = 1
            then total_price else 0 end)
            over (partition by {{var('customer_aggregate_on')}} 
            order by created_at rows between unbounded preceding and unbounded following)
            as customer_first_{{ day }}_day_revenue
            
        {% if not loop.last%} , {% endif %}
            
    {% endfor %}
    
{% endmacro %}

{% macro customer_values(days) %}
    
    {% for day in days %}
    
        orders.customer_first_{{ day }}_day_completed_orders,
        orders.customer_first_{{ day }}_day_revenue
        
        {% if not loop.last%} , {% endif %}
        
    {% endfor %}

{% endmacro %}