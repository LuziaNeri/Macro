with 
    rea as (
        select *       
        from {{ref('stg_rea')}} 
    )
        
    , transformations as (
            select
                {{ dbt_utils.generate_surrogate_key(['region_id', 'city']) }} as sk_gdp
                , *
            from rea
    )

select *
from transformations
