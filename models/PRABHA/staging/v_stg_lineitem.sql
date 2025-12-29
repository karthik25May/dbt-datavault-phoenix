{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "raw_lineitem"

derived_columns:
  RECORD_SOURCE: "!TPCH"
  LOAD_DATETIME: "CURRENT_TIMESTAMP()"

hashed_columns:
  LINEITEM_HK:
    columns:
      - L_ORDERKEY
      - L_LINENUMBER

  LINEITEM_HASHDIFF:
    is_hashdiff: true
    columns:
      - L_PARTKEY
      - L_SUPPKEY
      - L_QUANTITY
      - L_EXTENDEDPRICE
      - L_DISCOUNT
      - L_TAX
      - L_RETURNFLAG
      - L_LINESTATUS
      - L_SHIPDATE
      - L_COMMITDATE
      - L_RECEIPTDATE
      - L_SHIPINSTRUCT
      - L_SHIPMODE
      - L_COMMENT
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(
     source_model=metadata_dict['source_model'],
     include_source_columns=true,
     derived_columns=metadata_dict['derived_columns'],
     hashed_columns=metadata_dict['hashed_columns']
) }}
