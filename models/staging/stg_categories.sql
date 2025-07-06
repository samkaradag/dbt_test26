with source as (

    select * from {{ source('ecommerce', 'dagen_pipeline_ecommerce_sync_ecommerce_categories') }}

),

renamed as (

    select
        category_id,
        name as category_name,
        description as category_description,
        created_at

    from source

)

select * from renamed