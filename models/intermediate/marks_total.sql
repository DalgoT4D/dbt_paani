{{ config(materialized='table') }}

with marks as (
select 
    t."Id",
    t."RC",
    t."Name",
    t."RC_Num",
    t."taluka",
    t."village",
    t."district",
    t."Gat_Serial_No_",
    t."Gat_Total_Marks_Obtained",
    CASE WHEN t."Crop_Insurance_Mark" IS NULL THEN 0 ELSE t."Crop_Insurance_Mark" END AS Crop_Insurance_Mark,
    CASE WHEN t."Gat_Marks_For_Irjik" IS NULL THEN 0 ELSE t."Gat_Marks_For_Irjik" END AS Gat_Marks_For_Irjik,
    CASE WHEN t."Profit_Per_Acre_Marks" IS NULL THEN 0 ELSE t."Profit_Per_Acre_Marks" END AS Profit_Per_Acre_Marks,
    CASE WHEN t."Gat_Marks_For_Whats_App" IS NULL THEN 0 ELSE t."Gat_Marks_For_Whats_App" END AS Gat_Marks_For_Whats_App,
    CASE WHEN t."Profit_Percentage_Marks" IS NULL THEN 0 ELSE t."Profit_Percentage_Marks" END AS Profit_Percentage_Marks,
    CASE WHEN t."Gat_Marks_For_Design_SOP" IS NULL THEN 0 ELSE t."Gat_Marks_For_Design_SOP" END AS Gat_Marks_For_Design_SOP,
    CASE WHEN t."Gat_Marks_For_FSSAI_Testing" IS NULL THEN 0 ELSE t."Gat_Marks_For_FSSAI_Testing" END AS Gat_Marks_For_FSSAI_Testing,
    CASE WHEN t."Gat_Marks_For_Community_Work" IS NULL THEN 0 ELSE t."Gat_Marks_For_Community_Work" END AS Gat_Marks_For_Community_Work,
    CASE WHEN t."Gat_Marks_For_Exposure_Visit" IS NULL THEN 0 ELSE t."Gat_Marks_For_Exposure_Visit" END AS Gat_Marks_For_Exposure_Visit,
    CASE WHEN t."Gat_Marks_For_Soil_Fertility" IS NULL THEN 0 ELSE t."Gat_Marks_For_Soil_Fertility" END AS Gat_Marks_For_Soil_Fertility,
    CASE WHEN t."Gat_Marks_For_Joint_Purchase" IS NULL THEN 0 ELSE t."Gat_Marks_For_Joint_Purchase" END AS Gat_Marks_For_Joint_Purchase,
    CASE WHEN t."Gat_Marks_For_Value_Addition" IS NULL THEN 0 ELSE t."Gat_Marks_For_Value_Addition" END AS Gat_Marks_For_Value_Addition,
    CASE WHEN t."Gat_Marks_For_SOP_Implementation" IS NULL THEN 0 ELSE t."Gat_Marks_For_SOP_Implementation" END AS Gat_Marks_For_SOP_Implementation,
    CASE WHEN t."Gat_Marks_For_Previous_Year_Kharif" IS NULL THEN 0 ELSE t."Gat_Marks_For_Previous_Year_Kharif" END AS Gat_Marks_For_Previous_Year_Kharif,
    CASE WHEN t."Gat_Marks_For_FarmersBooksOfAccount" IS NULL THEN 0 ELSE t."Gat_Marks_For_FarmersBooksOfAccount" END AS Gat_Marks_For_FarmersBooksOfAccount,
    CASE WHEN t."Gat_Marks_For_Inter_Gat_Cooperation" IS NULL THEN 0 ELSE t."Gat_Marks_For_Inter_Gat_Cooperation" END AS Gat_Marks_For_Inter_Gat_Cooperation
from {{ref("marks")}} t

)

select * from marks

