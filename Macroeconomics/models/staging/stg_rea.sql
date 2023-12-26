with 
    source_rea as (
        select
            cast(PARSE_DATE('%d/%m/%Y', ISSUE_DT) as date) as issue_date
            , cast(CITY as string) as city
            , cast(STATE as string) as state_id  
            , cast(REGION as string) as region_id
            , cast(PRIMARYPROPERTY as string) as primary_propertry
            , cast(SUBCLASS as string) as type_construction
            , cast(VALUE as numeric) as value
            , cast(STAGE as string) as stage_construction
            , cast(UNITS as numeric) as units
            , cast(PARSE_DATE('%d/%m/%Y', TARGET_START) as date) as target_start_construction_date
            , cast(PARSE_DATE('%d/%m/%Y', TARGET_COMPLTN) as date) as target_complete_construction_date
            , cast(TYPE_NEW as string) as is_new
            , cast(PUBPRIV as string) as type_owner
        from {{ source('erp', 'REA_SAMPLE') }}
    )

select *
from source_rea