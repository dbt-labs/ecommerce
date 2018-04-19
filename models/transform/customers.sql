with customers as (

    select * from {{var('customers_table')}}

),

orders as (

    select * from {{ref('ORDERS_XF')}}

),

first_orders as (

    select * from orders
    where order_number = 1

),

joined as (

    select

        customers.*,
        first_orders.created_at as first_order_date

    from customers
    left join first_orders using (customer_id)

)

select * from joined
