with filtered as (

    select *
    from {{ ref('source__pokemon') }}
    where generation = 1

)

select * from filtered
