{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "raw_part"

derived_columns:
  RECORD_SOURCE: "!TPCH"
  LOAD_DATETIME: "CURRENT_TIMESTAMP()"

hashed_columns:
  PART_HK: "P_PARTKEY"
  PART_HASHDIFF:
    is_hashdiff: true
    columns:
      - P_NAME
      - P_MFGR
      - P_BRAND
      - P_TYPE
      - P_SIZE
      - P_CONTAINER
      - P_RETAILPRICE
      - P_COMMENT
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(
     source_model=metadata_dict['source_model'],
     include_source_columns=true,
     derived_columns=metadata_dict['derived_columns'],
     hashed_columns=metadata_dict['hashed_columns']
) }}
