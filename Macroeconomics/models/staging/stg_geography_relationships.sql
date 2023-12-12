with 
    source_geography_relationships as (
        select
            cast (GEO_ID as string) as country_id
            ,cast (GEO_NAME as string) as country_name
        from {{ source('erp', 'geography_relationships') }}
    )

select *
from source_geography_relationships