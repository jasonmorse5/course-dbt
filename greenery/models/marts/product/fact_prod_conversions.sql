{{
  config(
    materialized='table'
  )
}}

SELECT 
    p.product_id,
    p.name,
    p.price,
    p.inventory,
    prodsessions.dist_session_count,
    prodorders.prod_order_count,
    prodorders.prod_order_count / prodsessions.dist_session_count as conversion_rate
FROM {{ ref('stg_products') }} p
LEFT JOIN {{ ref('int_prod_sessions') }} prodsessions on p.product_id = prodsessions.product_id
LEFT JOIN {{ ref('int_prod_orders') }} prodorders on p.product_id = prodorders.product_id