{% macro check_duplicates_customer_id(model) %}
    WITH duplicate_check AS (
        SELECT
            customer_id,
            COUNT(*) AS record_count
        FROM {{ model }}
        GROUP BY customer_id
        HAVING COUNT(*) > 1
    )
    SELECT
        COUNT(*) AS duplicate_count
    FROM duplicate_check
    HAVING COUNT(*) > 0
{% endmacro %}
