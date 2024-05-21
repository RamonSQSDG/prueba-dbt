with original_nation as (
    select
    distinct(n_nationkey) as nation_id,
    n_name as nation,
    n_regionkey,
    n_comment

from {{ source ('stg_tables_tpch_sf1', 'nation')}}
),
original_region as (
    select
    distinct(r_regionkey) as region_id,
    r_name as region,
    r_comment

from {{ source ('stg_tables_tpch_sf1', 'region') }}
)

select n.nation, r.region, n.nation_id, r.region_id
from original_nation as n inner join original_region as r 
on n.n_regionkey = r.region_id