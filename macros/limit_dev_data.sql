{% macro limit_dev_data(row_count) -%}
  {# set row count limit on base tables for dev runs - '10000' is default value if not explicitly defined #}

  {% if target.name == 'dev' %}
    limit {{ var("row_count", "10000") }}
  {% endif %}
{%- endmacro %}
