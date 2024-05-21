with original_partsupp as (
    select
        ps_partkey,
        ps_suppkey,
        ps_availqty,
        ps_supplycost,
        ps_comment

    from {{ source ('stg_tables_tpch_sf1', 'partsupp') }}
)

select 
    concat(ps_partkey, '_',ps_suppkey) as partsupp_id,
    ps_availqty as availability,
    ps_supplycost as supply_cost_in_eur

from original_partsupp