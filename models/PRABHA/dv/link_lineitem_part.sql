{{ config(
    materialized='incremental',
    unique_key='LINEITEM_PART_HK'
) }}

{{ automate_dv.link(
    source_model='v_stg_lineitem',
    src_pk='LINEITEM_PART_HK',
    src_fk=['LINEITEM_HK','PART_HK'],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
