{{ config(
    materialized='incremental',
    unique_key='order_product_hk'
) }}

SELECT
    -- Hash key for the relationship
    HASH(
        l_orderkey,
        l_partkey
    ) AS order_product_hk,

    -- Hub keys
    l_orderkey  AS order_hk,
    l_partkey AS product_hk,

    CURRENT_TIMESTAMP() AS load_dts,
    'SRC_ORDERS' AS record_source

FROM {{ ref('v_stg_lineitem')}}

{% if is_incremental() %}
WHERE load_dts > (SELECT MAX(load_dts) FROM {{ this }})
{% endif %}
