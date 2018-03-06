with customers as (

    select * from {{var('customers_table')}}

),

orders as (

    select * from {{ref('ORDERS')}}
    where order_number = 1

),

joined as (

    select

        customers.*,
        orders.created_at as first_order_date

    from customers
    left join orders using (customer_id)

)

select * from joined
