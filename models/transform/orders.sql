with orders as (

    select * from {{var('orders_table')}}

),

final as (

    select

        *,

        row_number() over (
            partition by customer_id
            order by created_at
            ) as order_number

    from orders

)

select * from final
