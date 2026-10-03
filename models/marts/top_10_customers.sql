{{ config(materialized="view") }}

select
  customer_id,
  customer_name,
  city,
  total_orders,
  lifetime_revenue
from {{ ref('customer_summary') }} 
order by lifetime_revenue desc
limit 10
