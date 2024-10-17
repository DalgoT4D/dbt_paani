{{ config(materialized='table') }}

with marks as (

    select *
    FROM staging."marks"

)


select 
    t."Id",
    t."RC",
    t."Name",
    t."RC_Num",
    t."taluka",
    t."village",
    t."district",
    t."Gat_Serial_No_",
    CAST(t."Crop_Insurance_Mark" as decimal),
    CAST(t."Gat_Marks_For_Irjik" as decimal),
    CAST("Profit_Per_Acre_Marks" as decimal),
    CAST("Gat_Marks_For_Whats_App" as decimal),
    CAST("Profit_Percentage_Marks" as decimal),
    CAST(t."Gat_Marks_For_Design_SOP" as decimal) as "Gat_Marks_For_Design_SOP",
    CAST(t."Gat_Total_Marks_Obtained" as decimal),
    CAST(t."Gat_Marks_For_FSSAI_Testing" as decimal),
    CAST(t."Gat_Marks_For_Community_Work" as decimal),
    CAST(t."Gat_Marks_For_Exposure_Visit" as decimal),
    CAST(t."Gat_Marks_For_Joint_Purchase" as decimal),
    CAST(t."Gat_Marks_For_Soil_Fertility" as decimal),
    CAST(t."Gat_Marks_For_Value_Addition" as decimal),
    CAST(t."Gat_Marks_For_SOP_Implementation" as decimal),
    CAST(t."Gat_Marks_For_Previous_Year_Kharif" as decimal),
    CAST(t."Gat_Marks_For_FarmersBooksOfAccount" as decimal),
    CAST(t."Gat_Marks_For_Inter_Gat_Cooperation" as decimal)
from marks t order by t."Gat_Serial_No_"