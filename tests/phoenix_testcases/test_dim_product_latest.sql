SELECT
    part_key,
    COUNT(*) AS cnt
FROM {{ ref('dim_product') }}
GROUP BY part_key
HAVING COUNT(*) > 1
