with source as (

    select * from {{ source('ecommerce', 'dagen_pipeline_ecommerce_sync_ecommerce_order_items') }}

),

renamed as (

    select
        order_item_id,
        order_id,
        product_id,
        quantity,
        price_per_unit

    from source

)

select * from renamed