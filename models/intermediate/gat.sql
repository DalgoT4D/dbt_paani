{{ config(materialized='table') }}

with gat as (

   SELECT * FROM {{source('source_paani', 'gat_details')}}

)

select 
    t."Id",
    t."RC",
    t."Crop",
    t."Name",
    t."RC_NUM",
    t."taluka",
    t."Village",
    t."isBlank",
    t."Modifier",
    t."Gat_Admin",	
    t."SOP_Count",
    t."Valid_gat",
    t."Admin_count",
    t."Created_Date",
    t."ModifiedDate",
    CAST(t."Farmers_Count" as Integer),
    t."Gat_Serial_No",
    t."FG_FarmerCount",
    t."Gat_Total_Marks",
    t."Plot_photo_count",
    t."Nimanatrak_Number",
    t."Plot_photo_complete",
    t."Total_Cultivation_Area_Acres_"
from gat t
