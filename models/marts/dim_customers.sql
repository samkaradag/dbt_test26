with customers as (

    select *
    from {{ ref('stg_customers') }}

),

addresses as (

    select *
    from {{ ref('stg_addresses') }}

),

customer_addresses as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customers.email,
        customers.phone,
        addresses.street_address,
        addresses.city,
        addresses.state,
        addresses.postal_code,
        addresses.country
    from customers
    left join addresses on customers.customer_id = addresses.customer_id

)

select * from customer_addresses