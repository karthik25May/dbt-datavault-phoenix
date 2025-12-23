{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "raw_orders"

derived_columns:
  RECORD_SOURCE: "!TPCH"
  LOAD_DATETIME: "CURRENT_TIMESTAMP()"

hashed_columns:
  ORDER_HK: "O_ORDERKEY"
  CUSTOMER_HK: "O_CUSTKEY"
  ORDER_HASHDIFF:
    is_hashdiff: true
    columns:
      - O_ORDERSTATUS
      - O_TOTALPRICE
      - O_ORDERDATE
      - O_ORDERPRIORITY
      - O_CLERK
      - O_SHIPPRIORITY
      - O_COMMENT
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(
     source_model=metadata_dict['source_model'],
     include_source_columns=true,
     derived_columns=metadata_dict['derived_columns'],
     hashed_columns=metadata_dict['hashed_columns']
) }}
