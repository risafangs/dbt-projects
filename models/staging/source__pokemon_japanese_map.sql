
with source as (

    select * from {{ source('raw', 'pokemon_japanese_map') }}
    {{ limit_dev_data() }}

)

, renamed as (

    select
        replace(ndex, '#', '')::bigint as ndex
        , lower(english) as english_name
        , kana as japanese_name
        , lower(romaji) as romanized_name

    from source

)

select * from renamed

