select
    o_orderkey as order_id,
    o_custkey,
    o_orderstatus,
    o_totalprice,
    o_orderdate,
    o_orderpriority,
    o_clerk,
    o_shippriority,
    o_comment

from {{ source ('stg_tables_tpch_sf1', 'orders') }}