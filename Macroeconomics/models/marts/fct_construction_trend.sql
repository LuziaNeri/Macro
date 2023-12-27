with 
    construction_trend as (
        select *       
        from {{ref('stg_construction_trend')}} 
    )
        
    , transformations as (
            select
                {{ dbt_utils.generate_surrogate_key(['construction_type', 'construction_category']) }} as sk_construction_trend
                , *
            from construction_trend
    )

select *
from transformations
