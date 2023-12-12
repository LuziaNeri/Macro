with 
    source_gdp as (
        select
            cast (GEO_ID as string) as country_id
            , cast(VARIABLE as string) as variable
            , cast(VARIABLE_NAME as string) as variable_name
            , cast(DATE as date) as gdp_date
            , cast(VALUE as numeric) as gdp_value
            , cast(UNIT as string) as unit
        from {{ source('erp', 'datacommons_timeseries') }}
    )

select *
from source_gdp