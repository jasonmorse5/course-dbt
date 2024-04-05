{{
  config(
    materialized='table'
  )
}}

SELECT
    count (distinct e.order_id) / count (distinct e.session_id) as conversion_rate
FROM {{ ref('stg_events') }} e