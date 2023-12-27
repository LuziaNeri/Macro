with 
    source_construction_business_leads as (
        select
            parse_date('%Y', CAST(YEAR as string)) as year_date
            , cast(NAME as string) as business_name
            , cast(TYPE as string) as business_type
            , cast(PROJECT_CLASS as string) as project_class
            , cast(PROJECT_TYPE as string) as project_type
            , cast(PROJECTS_VALUE as numeric) as projects_value
            , cast(PROJECTS_COUNT as string) as projects_count
        from {{ source('erp', 'CONSTRUCTION__BUSINESS_LEADS_SAMPLE') }}
    )

select *
from source_construction_business_leads