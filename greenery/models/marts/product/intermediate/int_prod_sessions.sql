{{
  config(
    materialized='table'
  )
}}

SELECT 
    e.product_id,
    count (distinct e.session_id) as dist_session_count
FROM {{ ref('stg_events') }} e
WHERE e.product_id is not null
GROUP BY e.product_id