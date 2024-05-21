with original_supplier as (
    select
    s_suppkey as supplier_id,
    s_name,
    s_address,
    s_nationkey,
    s_phone,
    s_acctbal,
    s_comment

from {{ source ('stg_tables_tpch_sf1', 'supplier') }}
),
original_nation as (
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

select
    s.supplier_id,
    s.s_name,
    s.s_address,
    n.nation,
    r.region,
    s.s_phone,
    s.s_acctbal as balance_in_eur

from stg_supplier s
inner join original_nation n
on s.s_nationkey = n.nation_id
inner join original_region as r 
on n.n_regionkey = r.region_id