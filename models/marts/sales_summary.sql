select 
    order_id,
    order_date, 
    sum(total_revenue) as total_revenue
from {{ ref('int_order_revenue') }}
group by all
