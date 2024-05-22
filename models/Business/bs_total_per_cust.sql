-- which customer has spent the most money / how many orders has he made / current balance
WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(total_price) AS sum_total_price,
        COUNT(order_id) AS total_orders
    FROM {{ ref('tr_orders') }}
    GROUP BY customer_id
),
customer_ranking AS (
    SELECT
        customer_id,
        sum_total_price,
        total_orders,
        RANK() OVER (ORDER BY sum_total_price DESC) AS ranking
    FROM customer_totals
)
SELECT
    cr.ranking,
    cr.customer_id,
    cr.sum_total_price,
    cr.total_orders,
    c.balance_in_eur,
    c.nation,
    c.region

FROM customer_ranking cr
INNER JOIN {{ ref('tr_customers') }} c 
ON cr.customer_id = c.customer_id

ORDER BY cr.ranking asc