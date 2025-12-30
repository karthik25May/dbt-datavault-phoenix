{{ config(
    materialized='incremental',
    unique_key='LINEITEM_HASHDIFF'
) }}

{{ automate_dv.sat(
    source_model='v_stg_lineitem',
    src_pk='LINEITEM_HK',
    src_hashdiff='LINEITEM_HASHDIFF',
    src_payload=[
        'L_QUANTITY',
        'L_ORDERKEY',
        'L_PARTKEY',
        'L_EXTENDEDPRICE',
        'L_DISCOUNT',
        'L_TAX',
        'L_RETURNFLAG',
        'ORDER_PRODUCT_HK'
    ],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
