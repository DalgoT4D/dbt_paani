{{ config(materialized='table') }}

with sopdata as (

    select t."Gat_Id",
        t."Gat_No", 
        t."Taluka", 
        t."Village", 
        t."Gat_Name", 
        t."Crop_Name", 
        t."GatSop_Name",
        CASE 
            WHEN t."No_Of_Farmer_Implemented_GatSop" like '-' THEN 0 
            ELSE CAST(t."No_Of_Farmer_Implemented_GatSop" as integer)
        END as No_Of_Farmer_Implemented_GatSop ,
        cast(t."Farmers_Count" as integer) as Farmers_Count
    from {{ref("sopxgat")}} t
)

select *, 
    CASE 
        WHEN  No_Of_Farmer_Implemented_GatSop = Farmers_Count THEN 'COMPLETED'
        WHEN  No_Of_Farmer_Implemented_GatSop = 0 THEN 'NOT_STARTED'
        ELSE 'IN_PROGRESS'
    END AS STATUS
from sopdata




