with 
    construction_business_leads as (
        select *       
        from {{ref('stg_construction_business_leads')}} 
    )
        
    , transformations as (
            select
                {{ dbt_utils.generate_surrogate_key(['business_name', 'business_type']) }} as sk_construction_business_leads
                , *
            from construction_business_leads
    )

select *
from transformations
