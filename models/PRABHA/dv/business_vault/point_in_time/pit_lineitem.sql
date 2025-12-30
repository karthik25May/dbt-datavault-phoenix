{{ config(materialized='table') }}

SELECT
    lineitem_hk,
    MAX(LOAD_DATETIME) AS last_load_dts
FROM {{ ref('satellite_lineitem') }}
GROUP BY lineitem_hk
