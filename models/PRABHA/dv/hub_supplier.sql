{{ config(
    materialized='incremental',
    unique_key='SUPPLIER_HK'
) }}

{{ automate_dv.hub(
    source_model='v_stg_supplier',
    src_pk='SUPPLIER_HK',
    src_nk='S_SUPPKEY',
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
