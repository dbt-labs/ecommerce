with orders as (

    select * from {{var('orders_table')}}

),

order_numbers as (

    select

        *,

        row_number() over (
            partition by customer_id
            order by created_at
            ) as order_number

    from orders

),

final as (

    select

        *,

        case
            when order_number = 1
                then 'new'
            else 'repeat'
        end as new_or_repeat

    from order_numbers
)

select * from final
