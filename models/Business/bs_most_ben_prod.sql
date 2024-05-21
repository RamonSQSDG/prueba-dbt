-- show which product generates the most benefits and who manufacturers it
SELECT
    RANK() OVER (ORDER BY total_benefits_per_part_id DESC) AS ranking,
    part_id,
    product,
    manufacturer,
    total_benefits_per_part_id AS benefits_in_eur
FROM {{ ref('bs_prod_supp') }}
GROUP BY part_id,product,manufacturer,benefits_in_eur
ORDER BY benefits_in_eur DESC
LIMIT 10000
