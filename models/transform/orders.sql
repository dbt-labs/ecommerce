with orders as (

    select * from {{var('ORDERS_TABLE')}}

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

new_repeat_field as (

    select

        *,

        case
            when order_number = 1
                then 'new'
            else 'repeat'
        end as new_or_repeat

    from order_numbers
),

first_orders as (

    select

        *,

        min(created_at) over
            (partition by customer_id
                order by created_at
                    rows between unbounded preceding and unbounded following)
        as first_order_date

    from new_repeat_field

),

order_months as (

    select

        *,

        datediff(month, first_order_date, created_at) as months_from_start

    from first_orders
)

select * from order_months
