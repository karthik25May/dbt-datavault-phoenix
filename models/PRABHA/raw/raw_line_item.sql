{{ config(materialized='incremental',
unique_key=['L_ORDERKEY', 'L_LINENUMBER'] 
)
}}
select *
from {{ source('tpch', 'LINEITEM') }}
LIMIT 10000