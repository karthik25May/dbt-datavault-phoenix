{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "raw_supplier"

derived_columns:
  RECORD_SOURCE: "!TPCH"
  LOAD_DATETIME: "CURRENT_TIMESTAMP()"

hashed_columns:
  SUPPLIER_HK: "S_SUPPKEY"
  SUPPLIER_HASHDIFF:
    is_hashdiff: true
    columns:
      - S_NAME
      - S_ADDRESS
      - S_NATIONKEY
      - S_PHONE
      - S_ACCTBAL
      - S_COMMENT
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(
     source_model=metadata_dict['source_model'],
     include_source_columns=true,
     derived_columns=metadata_dict['derived_columns'],
     hashed_columns=metadata_dict['hashed_columns']
) }}
