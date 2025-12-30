{{ config(
    materialized='incremental',
    unique_key='CUSTOMER_HK'
) }}

{{ automate_dv.hub(
    source_model='v_stg_cust',
    src_nk='C_CUSTKEY',
    src_pk='CUSTOMER_HK',
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}