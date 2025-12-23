{{ config(materialized='view') }}

select *
from {{ source('tpch', 'ORDERS') }}
