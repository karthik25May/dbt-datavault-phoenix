{{ config(
    materialized='incremental',
    unique_key='PART_HK'
) }}

{{ automate_dv.hub(
    source_model='stg_part',
    src_pk='PART_HK',
    src_nk='P_PARTKEY',
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}