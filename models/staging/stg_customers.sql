with source as (

    select * from {{ source('ecommerce', 'dagen_pipeline_ecommerce_sync_ecommerce_customers') }}

),

renamed as (

    select
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        created_at

    from source

)

select * from renamed