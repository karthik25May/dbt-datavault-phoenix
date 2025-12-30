{{ config(
    materialized='incremental',
    unique_key='ORDER_HK'
) }}

{{ automate_dv.hub(
    source_model='v_stg_orders',
    src_nk='O_ORDERKEY',
    src_pk='ORDER_HK',
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}