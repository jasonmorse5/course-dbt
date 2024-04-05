{{
  config(
    materialized='table'
  )
}}

{% set event_types = dbt_utils.get_column_values (
    table=ref('stg_events'),
    column='event_type'
) %}

SELECT 
    e.session_id,
    e.user_id,
    coalesce(e.product_id, oi.product_id) as product_id,
    {% for event_type in event_types %}
    {{ sum_of('e.event_type', event_type)}} as {{event_type}},
    {% endfor %}
FROM {{ ref('stg_events') }} e
LEFT JOIN {{ ref('stg_order_items') }} oi on e.order_id = oi.order_id
GROUP BY 1, 2, 3