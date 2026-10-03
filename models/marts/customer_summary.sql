{{ config(materialized="view") }}

select
  customer_id, customer_name, city, customer_type,
  total_orders,
  lifetime_revenue,
  first_order_date,
  last_order_date
from {{ ref('int_customer_order_metrics') }} 
