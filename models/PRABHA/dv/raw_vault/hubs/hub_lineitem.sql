{{ config(
    materialized='incremental',
    unique_key='LINEITEM_HK'
) }}

{{ automate_dv.hub(
    source_model='v_stg_lineitem',
    src_pk='LINEITEM_HK',
    src_nk=['L_ORDERKEY','L_LINENUMBER'],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}