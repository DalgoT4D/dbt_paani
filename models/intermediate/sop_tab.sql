{{ config(materialized='table') }}

with sop as (

    select
        t."Gat_Id",
        t."Gat_No", 
        t."Taluka", 
        t."Village", 
        t."Gat_Name", 
        t."Crop_Name", 
        t."GatSop_Name",
        t."No_Of_Farmer_Implemented_GatSop"
    FROM staging."sop_table" t

)

    select * from sop t 


