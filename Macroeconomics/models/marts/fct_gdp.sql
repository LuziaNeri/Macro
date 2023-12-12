with 
    gdp as (
        select *       
        from {{ref('stg_gdp')}} 
    )
    
    , geo as (
        select *        
        from {{ref('stg_geography_relationships')}}
    )

    , joined as (
        select
            gdp.country_id
            , geo.country_name
            , gdp.gdp_date 
            , gdp.gdp_value
        from gdp
        left join geo on geo.country_id = gdp.country_id
    ) 
    
    , transformations as (
            select
                {{ dbt_utils.surrogate_key(['country_id', 'country_name']) }} as sk_gdp
                , *      
            from joined
            where country_id = 'country/USA'
    )

select *
from transformations
