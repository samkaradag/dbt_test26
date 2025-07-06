with source as (

    select * from {{ source('ecommerce', 'dagen_pipeline_ecommerce_sync_ecommerce_products') }}

),

renamed as (

    select
        product_id,
        name as product_name,
        description as product_description,
        price as product_price,
        sku,
        stock_quantity,
        category_id,
        created_at

    from source

)

select * from renamed