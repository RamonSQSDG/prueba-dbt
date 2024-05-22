with original_part as (
    select
    part_id,
    p_name as product,
    p_mfgr as manufacturer,
    p_brand as brand,
    p_type,
    p_size,
    p_container,
    p_retailprice as retail_price,
    p_comment

from {{ ref('stg_part') }}
)
select
    part_id,
    product,
    manufacturer,
    brand,
    p_type,
    p_size,
    p_container,
    retail_price
from original_part