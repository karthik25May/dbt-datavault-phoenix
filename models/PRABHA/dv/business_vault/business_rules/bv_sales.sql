SELECT
    s.lineitem_hk,
    l.order_hk,
    l.product_hk,
    s.l_quantity,
    s.l_extendedprice,
    s.l_returnflag,
    s.LOAD_DATETIME
FROM {{ ref('link_order_product') }} l
JOIN {{ ref('satellite_lineitem') }} s
  ON l.order_hk = s.l_orderkey
 AND l.product_hk = s.l_partkey

