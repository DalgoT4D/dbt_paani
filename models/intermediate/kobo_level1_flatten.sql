{{
    config(
        materialized="table"
    )
}}

WITH kobo_data AS (
    SELECT
        t._id,
        CAST(t.num_gats AS integer) as num_gats,
        CAST(t.loop0 AS jsonb) AS loop0
    FROM 
        {{ ref('kobo_flatten') }} t  
)

SELECT
    _id,
    num_gats,
    jsonb_array_elements(loop0) as loop_element
FROM 
    kobo_data