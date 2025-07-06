with products as (

    select *
    from {{ ref('stg_products') }}

),

categories as (

    select *
    from {{ ref('stg_categories') }}

),

product_categories as (

    select
        products.product_id,
        products.product_name,
        products.product_description,
        products.product_price,
        products.sku,
        products.stock_quantity,
        categories.category_name,
        categories.category_description
    from products
    left join categories on products.category_id = categories.category_id

)

select * from product_categories