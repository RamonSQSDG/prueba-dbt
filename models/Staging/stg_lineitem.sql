{% set condition = "1=1" %}
{{ delete_from_table_if_exists(target.database, this.schema, this.table, condition) }}

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

from {{ source ('stg_tables_tpch_sf1', 'lineitem')}}
order by l_orderkey asc
limit 10000