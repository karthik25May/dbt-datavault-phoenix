{{ config(
    materialized='incremental',
    unique_key='SUPPLIER_SAT_HK'
) }}

{{ automate_dv.sat(
    source_model='v_stg_supplier',
    src_pk='SUPPLIER_HK',
    src_hashdiff='SUPPLIER_HASHDIFF',
    src_payload=[
        'S_NAME',
        'S_ADDRESS',
        'S_NATIONKEY',
        'S_PHONE',
        'S_ACCTBAL',
        'S_COMMENT'
    ],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
