{% macro date_range(start_date, end_date) %}

{% set date_range_query %}
select '{{start_date}}'::date + i as "date" from generate_series(0, ('{{end_date}}'::date - '{{start_date}}'::date)) i
{% endset %}

{% set results = run_query(date_range_query) %}

{{ log(results, info=True) }}

{% if execute %}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}