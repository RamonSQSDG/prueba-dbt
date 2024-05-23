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


