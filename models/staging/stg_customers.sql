select
  cast(customer_id as bigint) as customer_id,
  initcap(trim(first_name)) as first_name,
  initcap(trim(last_name)) as last_name,
  concat(initcap(trim(first_name)), ' ', initcap(trim(last_name))) as customer_name,
  coalesce(initcap(trim(city)), 'Unknown') as city
from {{ source('landing', 'customers') }}