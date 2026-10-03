select
  date_trunc('month', order_date) as sales_month,
  count(distinct order_id) as order_count,
  cast(sum(total_revenue) as decimal(18,2)) as revenue
from {{ ref('sales_summary') }}
group by date_trunc('month', order_date)
