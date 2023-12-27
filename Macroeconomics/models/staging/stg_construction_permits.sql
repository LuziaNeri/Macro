with 
    source_construction_permits as (
        select
            cast(DATEADDED as date) as date_permits
            , cast(SITE_STATE as string) as state
            , cast(SITE_CITY as string) as city
            , cast(CLASS as string) as building_class
            , cast(PROJECTVALUE as numeric) as projects_value
            , cast(PROJECTSTATUS as string) as projects_status
        from {{ source('erp', 'CONSTRUCTION__PERMITS_SAMPLE_1') }}
    )

select *
from source_construction_permits