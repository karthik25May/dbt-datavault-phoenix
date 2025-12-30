{{ config(materialized='incremental') }}

WITH base AS (
    SELECT
        lineitem_hk,
        l_quantity,
        L_EXTENDEDPRICE,
        l_quantity * L_EXTENDEDPRICE AS total_amount,
        LOAD_DATETIME,
        record_source
    FROM {{ ref('satellite_lineitem') }}
)
SELECT *
FROM base
