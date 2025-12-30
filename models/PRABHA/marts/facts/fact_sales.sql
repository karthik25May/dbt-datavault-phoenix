SELECT
    order_hk,
    product_hk,
    l_quantity AS quantity,
    l_extendedprice AS price,

    CASE 
        WHEN l_returnflag = 'Y' THEN 0
        ELSE l_extendedprice
    END AS net_amount,

    CASE
        WHEN l_extendedprice > 10000 THEN 'HIGH_VALUE'
        ELSE 'STANDARD'
    END AS order_category,

    CURRENT_DATE AS snapshot_date
FROM {{ ref('bv_sales') }} l

-- PIT ensures latest record only
JOIN {{ ref('pit_lineitem') }} p
  ON l.lineitem_hk = p.lineitem_hk
  AND l.LOAD_DATETIME = p.last_load_dts
