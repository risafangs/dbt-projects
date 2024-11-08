with source as (

    select * from {{ source('raw', 'pokemon') }}
    {{ limit_dev_data() }} 
)

, renamed as (

    select
        "#" as number
        , lower("Name") as name
        , lower("Type 1") as type_1
        , lower("Type 2") as type_2
        , "Total" as total
        , "HP" as hp
        , "Attack" as attack
        , "Defense" as defense
        , "Sp. Atk" as special_attack
        , "Sp. Def" as special_defense
        , "Speed" as speed
        , "Generation" as generation
        , "Legendary" as is_legendary

    from source

)

, reordered as (

    select
        /* Primary key */
        name

        /* Foreign keys and IDs */
        , generation
        , number

        /* Attributes */
        , type_1
        , type_2

        /* Stats */
        , attack
        , defense
        , hp
        , special_attack
        , special_defense
        , speed
        , total
        , is_legendary

    from renamed

)

select * from reordered
