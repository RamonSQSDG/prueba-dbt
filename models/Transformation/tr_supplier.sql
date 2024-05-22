with original_supplier as (
    select
    supplier_id,
    s_name,
    s_address,
    s_nationkey,
    s_phone,
    s_acctbal,
    s_comment

from {{ ref('stg_supplier') }}
)

select
    s.supplier_id,
    s.s_name,
    s.s_address,
    l.nation,
    l.region,
    s.s_phone,
    s.s_acctbal as balance_in_eur

from stg_supplier s
inner join {{ ref('tr_location') }} l
on s.s_nationkey = l.nation_id