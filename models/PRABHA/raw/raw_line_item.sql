{{ config(materialized='incremental',
unique_key=['L_ORDERKEY', 'L_LINENUMBER'] 
)
}}
select *
from {{ source('tpch', 'LINEITEM') }}
WHERE l_orderkey > 6605026
LIMIT 5000