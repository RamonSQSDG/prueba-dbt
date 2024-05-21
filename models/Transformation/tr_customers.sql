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
)

select 
    c.customer_id,
    c.c_name,
    c.c_address,
    c.c_nationkey,
    l.nation,
    l.region,
    c.c_phone,
    c.c_acctbal as balance_in_eur,
    c.c_mktsegment as mktsegment

from original_customers as c
inner join {{ ref('tr_location') }} l
on c.c_nationkey = l.nation_id