select distinct oi.product_id
from {{ ref('stg_order_items') }} oi
left anti join {{ ref('stg_products') }} p
    on oi.product_id = p.product_id