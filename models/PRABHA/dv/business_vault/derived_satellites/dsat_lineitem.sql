{{ config(materialized='incremental') }}

WITH base AS (
    SELECT
        lineitem_hk,
        l_orderkey,
        l_partkey,
        l_returnflag,
        l_quantity,
        L_EXTENDEDPRICE,
        L_EXTENDEDPRICE AS total_amount,
        LOAD_DATETIME,
        record_source
    FROM {{ ref('satellite_lineitem') }}
)
SELECT *
FROM base
