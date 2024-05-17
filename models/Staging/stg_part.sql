select
    p_partkey as part_id,
    p_name,
    p_mfgr,
    p_brand,
    p_type,
    p_size,
    p_container,
    p_retailprice,
    p_comment

from {{ source ('stg_tables_tpch_sf1', 'part') }}