with customers as (

    select * from {{var('customers_table')}}

),

orders as (

    select * from {{ref('orders_xf')}}
    where order_seq_number = 1

),

joined as (
    
    {% set days = 

        var('days')
    
    %}

    select

        customers.*,
        orders.first_order_date,
        orders.first_completed_order_date,
        orders.lifetime_placed_orders,
        orders.lifetime_completed_orders,
        orders.lifetime_revenue,
        orders.lifetime_completed_revenue,
        orders.customer_age_days,
        coalesce(orders.customer_type, 'non_purchaser') as customer_type,
        
        {{ customer_values (days = days) }}

    from customers
    left join orders using ({{var('customer_join_on')}})

)

select * from joined
