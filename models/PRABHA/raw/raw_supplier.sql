{{ config(materialized='incremental', unique_key='s_suppkey') }}

select *
from {{ source('tpch', 'SUPPLIER') }}
where s_suppkey in (select l_suppkey from {{ref('raw_line_item') }})

