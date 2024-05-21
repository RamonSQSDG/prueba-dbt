-- desde la staging, probar si puedo borrar algo, utilizando la macro
select * from {{ ref('tr_customers') }}