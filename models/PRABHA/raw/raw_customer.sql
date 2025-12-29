{{ config(materialized='incremental', unique_key='c_custkey') }}

select *
from {{ source('tpch', 'CUSTOMER') }}
where c_custkey in (select O_CUSTKEY from {{ref('raw_orders') }})
