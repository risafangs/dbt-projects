{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if target.name == 'dev' -%}

        {{ default_schema ~ "_dev" }}

    {%- elif target.name == 'prod' -%}

        {{ default_schema ~ "_prod" }}

    {%- else -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}
