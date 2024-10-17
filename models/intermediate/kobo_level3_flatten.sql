{{ config(materialized='table') }}

with loop0_data AS (
SELECT
    _id,
    num_gats,
    gatid,
    gatcrop,
    gatname,
    gattaluka,
    gatvillage,
    farmer_name,
    loop1_count,
    jsonb_array_elements(loop1_element) as loop1_element
FROM 
    {{ref("kobo_level2_flatten")}}
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
    loop1_count,
    loop1_element->>'loop0/loop1/gatid_c' AS gatid_c,
    loop1_element->>'loop0/loop1/fnum_calc' AS fnum_calc,
    loop1_element->>'loop0/loop1/gatcrop_c' AS gatcrop_c,
    loop1_element->>'loop0/loop1/gatname_c' AS gatname_c,
    loop1_element->>'loop0/loop1/fname_calc' AS fname_calc,
    loop1_element->>'loop0/loop1/gattaluka_c' AS gattaluka_c,
    loop1_element->>'loop0/loop1/gatvillage_c' AS gatvillage_c
FROM 
    loop0_data