{{ config(materialized='incremental', unique_key='o_orderkey') }}

select *
from {{ source('tpch', 'ORDERS') }}
where o_orderkey in (select l_orderkey from {{ref('raw_line_item') }})
