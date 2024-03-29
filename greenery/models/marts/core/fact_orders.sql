{{
  config(
    materialized='table'
  )
}}

SELECT 
    o.order_id,
    o.promo_id,
    o.user_id,
    o.address_id,
    o.created_at,
    o.order_cost,
    o.shipping_cost,
    o.order_total,
    o.tracking_id,
    o.shipping_service,
    o.estimated_delivery_at,
    o.delivered_at,
    o.status,
    oi.product_id,
    oi.quantity,
    p.name,
    p.price,
    p.inventory,
    pr.discount,
    pr.status as pr_status,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_order_items') }} oi on o.order_id = oi.order_id
LEFT JOIN {{ ref('stg_products') }} p on oi.product_id = p.product_id
LEFT JOIN {{ ref('stg_promos') }} pr on o.promo_id = pr.promo_id
LEFT JOIN {{ ref('stg_users') }} u on o.user_id = u.user_id