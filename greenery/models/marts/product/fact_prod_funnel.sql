{{
  config(
    materialized='table'
  )
}}

SELECT
session_id,
CASE WHEN SUM(page_view) >0 THEN 1 ELSE 0 END as page_views,
CASE WHEN SUM(add_to_cart) >0 THEN 1 ELSE 0 END as add_to_cart,
CASE WHEN SUM(checkout) >0 THEN 1 ELSE 0 END as checkout,
CASE WHEN SUM(package_shipped) >0 THEN 1 ELSE 0 END as package_shipped,
FROM {{ ref('fact_page_views') }}
GROUP BY session_id