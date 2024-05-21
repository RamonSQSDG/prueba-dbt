with original_part as (
    select
    p_partkey as part_id,
    p_name as product,
    p_mfgr as manufacturer,
    p_brand as brand,
    p_type,
    p_size,
    p_container,
    p_retailprice as retail_price,
    p_comment

from {{ source ('stg_tables_tpch_sf1', 'part') }}
)
select
    part_id,
    product,
    manufacturer,
    brand,
    p_type,
    p_size,
    p_container,
    retail_price
from original_part