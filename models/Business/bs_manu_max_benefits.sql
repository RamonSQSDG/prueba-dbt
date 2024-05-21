WITH max_benefits AS (
    SELECT
        manufacturer,
        sum(benefits) as total_benefits,
        RANK() OVER (ORDER BY total_benefits DESC) AS ranking

    FROM {{ ref('bs_prod_supp') }}
    group by manufacturer
)
SELECT
    ranking,
    manufacturer,
    total_benefits
FROM
    max_benefits
order by total_benefits desc
