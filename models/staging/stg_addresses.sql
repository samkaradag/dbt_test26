with source as (

    select * from {{ source('ecommerce', 'dagen_pipeline_ecommerce_sync_ecommerce_addresses') }}

),

renamed as (

    select
        address_id,
        customer_id,
        street_address,
        city,
        state,
        postal_code,
        country,
        address_type

    from source

)

select * from renamed