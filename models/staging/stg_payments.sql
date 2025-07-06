with source as (

    select * from {{ source('ecommerce', 'dagen_pipeline_ecommerce_sync_ecommerce_payments') }}

),

renamed as (

    select
        payment_id,
        order_id,
        payment_date,
        payment_method,
        amount,
        status as payment_status

    from source

)

select * from renamed