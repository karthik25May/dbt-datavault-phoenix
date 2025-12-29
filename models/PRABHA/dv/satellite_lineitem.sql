{{ automate_dv.sat(
    source_model='v_stg_lineitem',
    src_pk='LINEITEM_HK',
    src_hashdiff='LINEITEM_HASHDIFF',
    src_payload=[
        'L_QUANTITY',
        'L_EXTENDEDPRICE',
        'L_DISCOUNT',
        'L_TAX'
    ],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
