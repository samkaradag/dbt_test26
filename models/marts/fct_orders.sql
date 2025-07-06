with orders as (

    select *
    from {{ ref('stg_orders') }}

),

order_items as (

    select *
    from {{ ref('stg_order_items') }}

),

payments as (

    select *
    from {{ ref('stg_payments') }}

),

customers as (

    select *
    from {{ ref('stg_customers') }}

),

order_payments as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.order_status,
        payments.payment_method,
        payments.payment_status,
        payments.amount
    from orders
    left join payments on orders.order_id = payments.order_id

),

final as (

    select
        order_payments.order_id,
        order_payments.customer_id,
        order_payments.order_date,
        order_payments.order_status,
        order_items.quantity,
        order_items.price_per_unit,
        order_payments.payment_method,
        order_payments.payment_status,
        order_payments.amount,
        customers.first_name,
        customers.last_name
    from order_payments
    left join order_items on order_payments.order_id = order_items.order_id
    left join customers on order_payments.customer_id = customers.customer_id

)

select * from final