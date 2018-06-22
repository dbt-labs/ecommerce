with customers_cte as (

    select * from {{var('customers_table')}}
),

orders_cte as (

    select * from {{ref('orders_xf')}}
    where order_seq_number = 1
),

joined as (

    select

        customers_cte.*,
        orders_cte.first_order_date,
        orders_cte.first_completed_order_date,
        orders_cte.lifetime_placed_orders,
        orders_cte.lifetime_completed_orders,
        orders_cte.lifetime_revenue,
        orders_cte.customer_age_days,
        orders_cte.customer_type,
        orders_cte.customer_first_30_day_completed_orders,
        orders_cte.customer_first_30_day_revenue,
        orders_cte.customer_first_60_day_completed_orders,
        orders_cte.customer_first_60_day_revenue,
        orders_cte.customer_first_90_day_completed_orders,
        orders_cte.customer_first_90_day_revenue

    from customers_cte
    left join orders_cte using (customer_id)
)

select * from joined
