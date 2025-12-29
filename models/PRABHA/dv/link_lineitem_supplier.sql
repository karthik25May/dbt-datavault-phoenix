{{ automate_dv.link (
    source_model=['v_stg_lineitem', 'v_stg_supplier'],
    src_fk=['LINEITEM_HK', 'SUPPLIER_HK'],
    src_ldts='LOAD_DATETIME',
    src_source='RECORD_SOURCE'
) }}
