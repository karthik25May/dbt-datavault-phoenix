{{ config(materialized='incremental',
unique_key=['L_ORDERKEY', 'L_LINENUMBER'] 
)
}}
select * , CURRENT_TIMESTAMP() AS LOAD_DATETIME
from {{ source('tpch', 'LINEITEM') }}
{% if is_incremental() %}
WHERE (L_ORDERKEY,L_LINENUMBER) NOT IN (SELECT L_ORDERKEY,L_LINENUMBER from DBT_PRABHA.RAW_PRABHA.raw_line_item )
{% endif %}
LIMIT 200