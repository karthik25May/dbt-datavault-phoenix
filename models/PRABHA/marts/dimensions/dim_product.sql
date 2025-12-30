{{ config(
    materialized = 'view'
) }}

WITH latest_product AS (

    SELECT
        h.PART_HK,
        s.P_NAME,
        s.P_TYPE,
        s.P_BRAND,
        s.LOAD_DATETIME,

        ROW_NUMBER() OVER (
            PARTITION BY h.PART_HK
            ORDER BY s.LOAD_DATETIME DESC
        ) AS rn

    FROM {{ ref('hub_part') }} h
    JOIN {{ ref('satellite_part') }} s
      ON h.PART_HK = s.PART_HK
)

SELECT
    PART_HK as part_key,
    P_NAME as product_name,
    P_TYPE as category,
    P_BRAND as brand
FROM latest_product
WHERE rn = 1
