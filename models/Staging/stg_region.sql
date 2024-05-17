select
    r_regionkey as region_id,
    r_name as region,
    r_comment

from {{ source ('stg_tables_tpch_sf1', 'region') }}