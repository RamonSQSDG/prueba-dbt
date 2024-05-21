with original_customers as (
    select
    c_custkey as customer_id,
    c_name,
    c_address,
    c_nationkey,
    c_phone,
    c_acctbal,
    c_mktsegment,
    c_comment

from {{ source('stg_tables_tpch_sf1', 'customer') }}
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
    c.customer_id,
    c.c_name,
    c.c_address,
    n.nation,
    r.region,
    c.c_phone,
    c.c_acctbal as balance_in_eur,
    c.c_mktsegment as mktsegment

from original_customers as c
inner join original_nation n
on c.c_nationkey = n.nation_id
inner join original_region as r 
on n.n_regionkey = r.region_id