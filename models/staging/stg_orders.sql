with source as (

    select * from {{ source('ecommerce', 'dagen_pipeline_ecommerce_sync_ecommerce_orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        order_date,
        status as order_status,
        shipping_address_id,
        billing_address_id,
        total_amount

    from source

)

select * from renamed