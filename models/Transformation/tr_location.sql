with original_nation as (
    select
    nation_id,
    nation,
    n_regionkey,
    n_comment

from {{ ref('stg_nation') }}
),
original_region as (
    select
    region_id,
    region,
    r_comment

from {{ ref('stg_region') }}
)

select n.nation, r.region, n.nation_id, r.region_id
from original_nation as n inner join original_region as r 
on n.n_regionkey = r.region_id