{{ config(materialized='view') }}

SELECT
    l.order_hk,
    l.product_hk,
    s.l_quantity as quantity,
    s.L_EXTENDEDPRICE as price,

    -- Revenue rule
    CASE 
        WHEN s.l_returnflag  IN ('Y') THEN 0
        ELSE s.l_quantity * s.L_EXTENDEDPRICE
    END AS net_amount,

    -- Classification
    CASE
        WHEN s.l_quantity * s.L_EXTENDEDPRICE > 10000 THEN 'HIGH_VALUE'
        ELSE 'STANDARD'
    END AS order_category,

    CURRENT_TIMESTAMP AS processed_dts

FROM {{ ref('link_order_product') }} l
JOIN {{ ref('satellite_lineitem') }} s
  ON l.order_product_hk = s.ORDER_PRODUCT_HK
