select
    max(cast(order_date as timestamp)) as max_loaded_at,
    current_timestamp() as snapshotted_at,
    "{{ env_var('DBT_FRESH_WARN_DAYS')}}" as warn_days,
    "{{ env_var('DBT_FRESH_ERROR_DAYS')}}" as error_days
from {{ source('landing', 'orders') }}