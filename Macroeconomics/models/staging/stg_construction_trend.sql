with 
    source_construction_trend as (
        select
            parse_date('%Y-%m', concat(cast(YEAR as STRING), '-', cast(MONTH as string))) as date_construction_trend
            , cast(CLASS as string) as construction_type
            , cast(CATEGORY as string) as construction_category
            , cast(PROJECTS_VALUE as numeric) as projects_value
            , cast(PROJECTS_COUNT as string) as projects_count
        from {{ source('erp', 'CONSTRUCTION__ROJECTS_TREND_SAMPLE') }}
    )

select *
from source_construction_trend