with 
    source_construction_trend as (
        select
            cast(cast(YEAR as string)as date) as year_construction_trend
            , cast(MONTH as string) as month_construction_trend
            , cast(CLASS as string) as construction_type
            , cast(CATEGORY as string) as construction_category
            , cast(PROJECTS_VALUE as numeric) as projects_value
            , cast(PROJECTS_COUNT as string) as projects_count
        from {{ source('erp', 'CONSTRUCTION__ROJECTS_TREND_SAMPLE') }}
    )

select *
from source_construction_trend