{{ config(
    materialized='incremental',
    unique_key='ORDER_HASHDIFF'
) }}

{{ automate_dv.sat(
    source_model='v_stg_orders',
    src_pk='ORDER_HK',
    src_hashdiff='ORDER_HASHDIFF',
     src_payload=[
      'O_ORDERSTATUS',
      'O_TOTALPRICE',
      'O_ORDERDATE',
      'O_ORDERPRIORITY',
      'O_CLERK',
      'O_SHIPPRIORITY',
      'O_COMMENT'
    ],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}