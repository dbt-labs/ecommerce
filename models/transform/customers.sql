with customers as (

    select * from {{var('customers_table')}}
),

orders as (

    select * from {{ref('orders_xf')}}
    where order_seq_number = 1

),

joined as (

    select

        customers.*,
        orders.first_order_date,
        orders.first_completed_order_date,
        orders.lifetime_placed_orders,
        orders.lifetime_completed_orders,
        orders.lifetime_revenue,
        orders.customer_age_days,
        orders.customer_type,
        orders.customer_first_30_day_completed_orders,
        orders.customer_first_30_day_revenue,
        orders.customer_first_60_day_completed_orders,
        orders.customer_first_60_day_revenue,
        orders.customer_first_90_day_completed_orders,
        orders.customer_first_90_day_revenue

    from customers
    left join orders using (customer_id)
)

select * from joined
