with base as (

    select * from {{ ref('int_kanto_pokemon') }}

)

select * from base
