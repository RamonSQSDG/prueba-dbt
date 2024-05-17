select
    ps_partkey,
    ps_suppkey,
    ps_availqty,
    ps_supplycost,
    ps_comment

from {{ source ('stg_tables_tpch_sf1', 'partsupp') }}