{% macro check_order_id(model) %}

    WITH validation AS (
        SELECT *
        FROM {{ model }}
        WHERE NOT REGEXP_LIKE(order_id, '^[0-9]+$')
    )

    SELECT *
    FROM validation

{% endmacro %}