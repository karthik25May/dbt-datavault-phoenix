{{ automate_dv.sat(
    source_model='v_stg_cust',
    src_pk='CUSTOMER_HK',
    src_hashdiff='CUSTOMER_HASHDIFF',
     src_payload=[
        'C_NAME',
        'C_ADDRESS',
        'C_NATIONKEY',
        'C_PHONE',
        'C_ACCTBAL',
        'C_MKTSEGMENT',
        'C_COMMENT'
    ],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}