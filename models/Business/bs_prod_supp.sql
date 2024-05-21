-- How much does each product generates? / befefits per individual supplier
SELECT
    p.part_id,
    p.product,
    p.manufacturer,
    ps.supplier_id,
    p.retail_price,
    ps.supply_cost,
    p.retail_price - ps.supply_cost AS benefits,
    SUM(p.retail_price - ps.supply_cost) OVER (PARTITION BY p.part_id) AS total_benefits_per_part_id
FROM {{ ref('tr_part') }} p
INNER JOIN {{ ref('tr_partsupp') }} ps
ON p.part_id = ps.part_id
