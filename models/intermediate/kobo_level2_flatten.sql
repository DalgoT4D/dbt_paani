{{ config(materialized='table') }}

with loop0_data AS (
SELECT
    _id,
    num_gats,
    loop_element->>'loop0/gatid' AS gatid,
    loop_element->>'loop0/gatcrop' AS gatcrop,
    loop_element->>'loop0/gatname' AS gatname,
    loop_element->>'loop0/gattaluka' AS gattaluka,
    loop_element->>'loop0/gatvillage' AS gatvillage,
    loop_element->>'loop0/farmer_name' AS farmer_name,
    loop_element->>'loop0/loop1_count' AS loop1_count,
    loop_element->>'loop0/loop1' as loop1_element
FROM 
    {{ref("kobo_level1_flatten")}}
)

SELECT
        _id,
        num_gats,
        gatid,
        gatcrop,
        gatname,
        gattaluka,
        gatvillage,
        farmer_name,
        CAST(loop1_count AS integer) as loop1_count,
        CAST(loop1_element AS jsonb) as loop1_element
FROM 
    loop0_data