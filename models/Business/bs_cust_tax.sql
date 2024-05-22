select
    l.lineitem_id,
    c.customer_id,
    l.quantity,
    l.extended_price,
    o.total_price,
    l.discount,
    l.tax,
    l.unit_price,
    c.nation,
    c.region

from {{ ref('tr_customers') }} c
inner join {{ ref('tr_orders') }} o
on c.customer_id=o.customer_id
inner join {{ ref('tr_lineitem') }} l
on o.order_id=l.l_orderkey

order by l.lineitem_id asc
limit 10000