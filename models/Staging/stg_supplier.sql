select
    s_suppkey as supplier_id,
    s_name,
    s_address,
    s_nationkey,
    s_phone,
    s_acctbal,
    s_comment

from {{ source ('stg_tables_tpch_sf1', 'supplier') }}
