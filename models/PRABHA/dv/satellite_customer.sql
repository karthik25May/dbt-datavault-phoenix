{{ automate_dv.sat(
    source_model=ref('v_stg_customer'),
    hub_model=ref('hub_customer'),
    load_columns=['C_NAME', 'C_ADDRESS'],
    record_source='TPCH_CUSTOMER'
) }}
