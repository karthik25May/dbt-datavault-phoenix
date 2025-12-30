SELECT
    order_hk as order_id,
    product_hk as product,
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
FROM {{ ref('bv_sales') }}
