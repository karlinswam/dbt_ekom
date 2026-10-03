select
  p.category,
  cast(sum(i.quantity * i.price) as decimal(18,2)) as revenue,
  sum(i.quantity) as units_sold
from {{ ref('stg_order_items') }} i
join {{ ref('stg_products') }} p using (product_id)
group by p.category
