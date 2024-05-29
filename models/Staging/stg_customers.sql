{% set condition = "1=1" %}
{{ delete_from_table_if_exists(target.database, this.schema, this.table, condition) }}

select
    c_custkey as customer_id,
    c_name,
    c_address,
    c_nationkey,
    c_phone,
    c_acctbal,
    c_mktsegment,
    c_comment

from {{ source('stg_tables_tpch_sf1', 'customer') }}
order by customer_id asc


-- Para hacerlo incremental
{% if is_incremental() %}
    where customer_id > (select (max(customer_id)) from {{ this }})
{% endif %}
--{{ this }} para referirnos a la tabla que estamos creando/actualizando

-- básicamente esto hace lo mismo que mi macro de delete, pero de esta manera comprobamos que el último customer_id sea más pequeño que lo nuevo que estamos metiendo
-- para de esta manera que no haya duplicados y no se me vuelvan a cargar los datos antiguos. Hay que hacerlo para todas las incrementales, y digamos que es obligatorio
