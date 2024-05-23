
{% set condition = "1=1" %}
{{ delete_from_table_if_exists(target.database, this.schema, this.table, condition) }}

select
    ps_partkey,
    ps_suppkey,
    ps_availqty,
    ps_supplycost,
    ps_comment

from {{ source ('stg_tables_tpch_sf1', 'partsupp') }}
order by ps_partkey, ps_suppkey asc
limit 10000