{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "raw_customer"

derived_columns:
  RECORD_SOURCE: "!TPCH"
  LOAD_DATETIME: "CURRENT_TIMESTAMP()"

hashed_columns:
  CUSTOMER_HK: "C_CUSTKEY"
  CUSTOMER_HASHDIFF:
    is_hashdiff: true
    columns:
      - C_NAME
      - C_ADDRESS
      - C_NATIONKEY
      - C_PHONE
      - C_ACCTBAL
      - C_MKTSEGMENT
      - C_COMMENT
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(
     source_model=metadata_dict['source_model'],
     include_source_columns=true,
     derived_columns=metadata_dict['derived_columns'],
     hashed_columns=metadata_dict['hashed_columns']
) }}
