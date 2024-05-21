-- see which shipping mode is the fastest
with shipping_duration as (
    select
        ship_mode,
        avg(DATEDIFF(day, ship_date, receipt_date)) AS avg_shipping_duration
    from {{ ref('tr_lineitem') }}
    group by ship_mode
)
select
    RANK() OVER (ORDER BY avg_shipping_duration asc) AS ranking,
    ship_mode,
    avg_shipping_duration
from shipping_duration
order by ranking
limit 10
    

