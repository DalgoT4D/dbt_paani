{{
    config(
        materialized="table"
    )
}}

WITH kobo_data AS (
    SELECT
        cast(t._id as integer) as _id,
        cast(gatid as integer) as id, 
        gatcrop, 
        gattaluka, 
        gatname, 
        gatvillage, 
        cast(loop1_count as integer) as loop1_count
    FROM 
        {{ ref('kobo_level3_flatten') }} t  
)

select distinct * from kobo_data order by _id