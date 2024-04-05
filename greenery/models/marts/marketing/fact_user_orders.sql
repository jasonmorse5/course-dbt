{{
  config(
    materialized='table'
  )
}}

SELECT 
    iuod.user_id,
    du.first_name,
    du.last_name,
    du.email,
    du.phone_number,
    du.address,
    du.zipcode,
    du.state,
    du.country,
    first_order,
    last_order,
    order_count,
    total_spend
FROM {{ ref('int_user_order_details') }} iuod
LEFT JOIN {{ ref('dim_users') }} du on iuod.user_id = du.user_id