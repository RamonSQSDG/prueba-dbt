-- desde la staging, probar si puedo borrar algo, utilizando la macro
-- delete_from_table_if_exists(database, schema, table, condition)

{{ delete_from_table_if_exists(target.database,this.schema,'tr_customers','customer_id=2') }}

select * from {{ ref('tr_customers') }}
order by customer_id
limit 10000