with original_partsupp as (
    select
        ps_partkey as part_id,
        ps_suppkey as supplier_id,
        ps_availqty as availability,
        ps_supplycost as supply_cost,
        ps_comment

    from {{ ref('stg_partsupp') }}
)

select 
    concat(part_id, '_',supplier_id) as partsupp_id,
    part_id,
    supplier_id,
    availability,
    supply_cost

from original_partsupp