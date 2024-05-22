{% set condition = "1=1" %}
{{ delete_from_table_if_exists(target.database, this.schema, this.table, condition) }}

select
    r_regionkey as region_id,
    r_name as region,
    r_comment

from {{ source ('stg_tables_tpch_sf1', 'region') }}