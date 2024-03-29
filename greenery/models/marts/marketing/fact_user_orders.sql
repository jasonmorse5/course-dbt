{{
  config(
    materialized='table'
  )
}}

SELECT 
    o.user_id,
    du.first_name,
    du.last_name,
    du.email,
    du.phone_number,
    du.address,
    du.zipcode,
    du.state,
    du.country,
    min(o.created_at) as first_order,
    max(o.created_at) as last_order,
    count(o.order_id) as order_count,
    sum(o.order_total) as total_spend
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('dim_users') }} du on o.user_id = du.user_id
GROUP BY  o.user_id, du.first_name, du.last_name, du.email, du.phone_number, du.address, du.zipcode, du.state, du.country