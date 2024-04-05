{{
  config(
    materialized='table'
  )
}}

SELECT 
    distinct oi.product_id,
    count (distinct oi.order_id) as prod_order_count
FROM {{ ref('stg_order_items') }} oi
GROUP BY oi.product_id