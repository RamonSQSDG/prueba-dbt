with original_lineitem as (
    select
        l_orderkey,
        l_partkey,
        l_suppkey,
        l_linenumber,
        l_quantity,
        l_extendedprice as extended_price,
        l_discount,
        l_tax,
        l_returnflag,
        l_linestatus,
        l_shipdate,
        l_commitdate,
        l_receiptdate,
        l_shipinstruct,
        l_shipmode,
        l_comment
    from {{ source('stg_tables_tpch_sf1', 'lineitem') }}
),
original_customers as (
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
original_orders as (
    select
    o_orderkey as order_id,
    o_custkey as customer_id,
    o_orderstatus,
    o_totalprice as total_price,
    o_orderdate,
    o_orderpriority,
    o_clerk,
    o_shippriority,
    o_comment

from {{ source ('stg_tables_tpch_sf1', 'orders') }}
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
    concat(l.l_orderkey, '_', l.l_linenumber) as lineitem_id,
    c.customer_id,
    cast(l.l_quantity as integer) as quantity,
    l.extended_price,
    o.total_price,
    concat(cast(l.l_discount * 100 as integer), '%') as discount,
    concat(cast(l.l_tax * 100 as integer), '%') as tax,
    round((l.extended_price / ((1 - l.l_discount) * (1 + l.l_tax))) / l.l_quantity,2) AS unit_price,
    n.nation,
    r.region

from original_customers c
inner join original_orders o
on c.customer_id=o.customer_id
inner join original_lineitem l
on o.order_id=l.l_orderkey
inner join original_nation n
on c.c_nationkey = n.nation_id
inner join original_region as r 
on n.n_regionkey = r.region_id

order by lineitem_id asc