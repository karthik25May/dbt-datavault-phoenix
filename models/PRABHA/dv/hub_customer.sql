{{ automate_dv.hub(
    source_model=ref('v_stg_customer'),
    business_key='C_CUSTKEY',
    record_source='TPCH_CUSTOMER'
) }}
