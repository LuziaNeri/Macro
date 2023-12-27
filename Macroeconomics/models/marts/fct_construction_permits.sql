with 
    construction_permits_first as (
        select *       
        from {{ref('stg_construction_permits')}} 
    )

    , construction_permits_second as (
        select *        
        from {{ref('stg_construction_permits_second')}}
    )

    , joined as (
        select
            coalesce(construction_permits_first.date_permits, construction_permits_second.date_permits) as date_permits
            , coalesce(construction_permits_first.state, construction_permits_second.state) as state
            , coalesce(construction_permits_first.city, construction_permits_second.city) as city
            , coalesce(construction_permits_first.building_class, construction_permits_second.building_class) as building_class
            , coalesce(construction_permits_first.projects_value, construction_permits_second.projects_value) as projects_value
            , coalesce(construction_permits_first.projects_status, construction_permits_second.projects_status) as projects_status
        from construction_permits_first
        full join construction_permits_second on construction_permits_first.city = construction_permits_second.city
    )

    , transformations as (
        select
            {{ dbt_utils.generate_surrogate_key(['city', 'state']) }} as sk_construction_permits
            , *      
        from joined
    )
select *
from transformations
