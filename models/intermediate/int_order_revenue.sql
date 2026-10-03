select
  o.order_id,
  o.customer_id,
  o.order_date,
  cast(sum(i.quantity * i.price) as decimal(18,2)) as total_revenue
from {{ ref('stg_orders') }} o
join {{ ref('stg_order_items') }} i using (order_id)
group by o.order_id, o.customer_id, o.order_date
