{{
    config(
        materialized="table"
    )
}}

WITH kobo_data AS (
    SELECT
        CAST(t._id as integer) as _id,
        CAST(t.loop0_count AS integer) as loop0_count,
        CAST(t.other_males AS integer) as other_males,
        CAST(t.other_females AS integer) as other_females
    FROM 
        {{ ref('kobo_flatten') }} t  
)

select _id, loop0_count, other_males, other_females, (other_females+other_males) as total_other_attendees from kobo_data