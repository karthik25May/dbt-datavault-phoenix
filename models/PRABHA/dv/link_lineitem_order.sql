{{ config(
    materialized='incremental',
    unique_key='LINEITEM_HK'
) }}

{{ automate_dv.link(
    source_model='v_stg_lineitem',
    src_pk='LINEITEM_HK',
    src_fk=['LINEITEM_HK','ORDER_HK'],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
