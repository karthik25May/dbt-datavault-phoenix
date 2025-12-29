{{ config(
    materialized='incremental',
    unique_key='ORDER_CUSTOMER_HK'
) }}

{{ automate_dv.link(
    source_model='v_stg_orders',
    src_pk='ORDER_CUSTOMER_HK',
    src_fk=['ORDER_HK','CUSTOMER_HK'],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
