select
  customer_id,
  count(distinct order_id) as total_orders,
  min(order_date) as first_order_date,
  max(order_date) as last_order_date
from {{ ref('stg_orders') }}
group by customer_id
