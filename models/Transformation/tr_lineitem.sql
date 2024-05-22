with original_lineitem as (
    select
        l_orderkey,
        l_partkey,
        l_suppkey,
        l_linenumber,
        l_quantity,
        l_extendedprice,
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
    from {{ ref('stg_lineitem') }}
)

select
    concat(l_orderkey, '_', l_linenumber) as lineitem_id,
    l_orderkey,
    l_linenumber,
    l_partkey,
    l_suppkey,
    cast(l_quantity as integer) as quantity,
    l_extendedprice as extended_price,
    concat(cast(l_discount * 100 as integer), '%') as discount,
    l_discount,
    concat(cast(l_tax * 100 as integer), '%') as tax,
    l_tax,
    round((l_extendedprice / ((1 - l_discount) * (1 + l_tax))) / l_quantity,2) AS unit_price,
    l_returnflag,
    l_linestatus,
    l_shipdate as ship_date,
    l_commitdate as commit_date,
    l_receiptdate as receipt_date,
    l_shipinstruct,
    l_shipmode as ship_mode

from original_lineitem
