with 
    source_construction_permits_second as (
        select
            cast(EFFECTIVE_DATE as date) as date_permits
            , cast(STATE as string) as state
            , cast(CITY as string) as city
            , initicap(regexp_replace(array_reverse(split(PROJECT_TYPE, ','))[offset(0)], r'["\[\]]', '')) as building_class
            , cast(JOB_VALUE as numeric) as projects_value
            , cast(STATUS as string) as projects_status
        from {{ source('erp', 'CONSTRUCTION__PERMITS_SAMPLE_2') }}
    )

select *
from source_construction_permits_second