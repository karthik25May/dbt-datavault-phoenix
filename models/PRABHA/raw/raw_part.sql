{{ config(materialized='incremental', unique_key='p_partkey') }}

select *
from {{ source('tpch', 'PART') }}
where p_partkey in (select l_partkey from {{ref('raw_line_item') }})

