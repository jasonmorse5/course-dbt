{{
  config(
    materialized='table'
  )
}}

SELECT 
    e.event_id,
    e.session_id,
    e.user_id,
    e.event_type,
    e.page_url,
    e.created_at,
    e.order_id,
    e.product_id,
    p.name,
    p.price,
    p.inventory
FROM {{ ref('stg_events') }} e
LEFT JOIN {{ ref('stg_products') }} p on e.product_id = p.product_id
WHERE e.event_type = 'page_view'