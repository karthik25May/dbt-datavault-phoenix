{{ config(
    materialized='incremental',
    unique_key='PART_HASHDIFF'
) }}

{{ automate_dv.sat(
    source_model='v_stg_part',
    src_pk='PART_HK',
    src_hashdiff='PART_HASHDIFF',
    src_payload=[
        'P_NAME',
        'P_MFGR',
        'P_BRAND',
        'P_TYPE',
        'P_SIZE',
        'P_CONTAINER',
        'P_RETAILPRICE',
        'P_COMMENT'
    ],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
