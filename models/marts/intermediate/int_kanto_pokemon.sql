/*
   The purpose of this model is to pull out only pokemon from generation 1 (Kanto)
   and join them with their Japanese name.
*/

with filtered as (

    select *
    from {{ ref('source__pokemon') }}
    where
        generation = 1
        and name not like '%mega%'

)

, japanese_mapping as (

    select * from {{ ref('source__pokemon_japanese_map') }}

)

, combined as (
/* join two datasets to add Japanese name to record */

    select
        filtered.*
        , japanese_mapping.romanized_name
        , get_current_time() as loaded_at /* utc */
 
    from filtered
    inner join japanese_mapping on filtered.number = japanese_mapping.ndex

)

select * from combined
