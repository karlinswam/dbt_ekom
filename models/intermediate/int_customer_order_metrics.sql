select
  coalesce(r.customer_id, c.customer_id) as customer_id, c.customer_name, c.city,
  coalesce(min(r.order_date), null) as first_order_date,
  coalesce(max(r.order_date), null) as last_order_date,
  coalesce(count(distinct r.order_id),0) as total_orders,
  cast(sum(r.total_revenue) as decimal(18,2)) as lifetime_revenue,
  case 
    when count(distinct r.order_id) > 1 then 'Repeat' 
    when count(distinct r.order_id) = 1 then 'New'     else 'No Orders' 
  end as customer_type
from {{ ref('int_order_revenue') }} r 
full outer join {{ ref('stg_customers') }} c using (customer_id)
group by all
