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
    c.nation,
    c.region

from {{ ref('tr_customers') }} c
inner join {{ ref('tr_orders') }} o
on c.customer_id=o.customer_id
inner join original_lineitem l
on o.order_id=l.l_orderkey

order by lineitem_id asc
limit 10000