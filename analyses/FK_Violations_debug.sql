select distinct oi.product_id
from dbt_ekom_analytics.bronze.stg_order_items oi
left anti join dbt_ekom_analytics.bronze.stg_products p
    on oi.product_id = p.product_id