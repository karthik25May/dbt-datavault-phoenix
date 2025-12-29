{{ config(
    materialized='incremental',
    unique_key='LINEITEM_SUPPLIER_HK'
) }}

{{ automate_dv.link(
    source_model='stg_lineitem',
    src_pk='LINEITEM_SUPPLIER_HK',
    src_fk=['LINEITEM_HK','SUPPLIER_HK'],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
