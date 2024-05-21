with original_orders as (
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
)
select
    order_id,
    o_custkey as customer_id,
    o_orderstatus,
    o_totalprice as total_price,
    o_orderdate,
    o_orderpriority,
    o_clerk,
    o_shippriority,
    o_comment

from original_orders