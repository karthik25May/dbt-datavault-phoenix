SELECT
    link_order_product_hk,
    order_hk,
    product_hk
FROM {{ ref('link_order_product') }}
