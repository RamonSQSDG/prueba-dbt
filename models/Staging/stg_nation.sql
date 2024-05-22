{% set condition = "1=1" %}
{{ delete_from_table_if_exists(target.database, this.schema, this.table, condition) }}

select
    n_nationkey as nation_id,
    n_name as nation,
    n_regionkey,
    n_comment

from {{ source ('stg_tables_tpch_sf1', 'nation')}}