{{ config(materialized='table') }}

with marks as (

    select 
   *,
    (t."crop_insurance_mark"+t."gat_marks_for_irjik"+"profit_per_acre_marks"+
    t."gat_marks_for_whats_app" + "profit_percentage_marks" + t."gat_marks_for_design_sop" +
    t."gat_marks_for_fssai_testing" + t."gat_marks_for_community_work" +
    t."gat_marks_for_exposure_visit" + t."gat_marks_for_joint_purchase" +
    t."gat_marks_for_soil_fertility" + t."gat_marks_for_value_addition" + t."gat_marks_for_sop_implementation" +
    t."gat_marks_for_previous_year_kharif" + t."gat_marks_for_farmersbooksofaccount" +
    t."gat_marks_for_inter_gat_cooperation") as Total_Marks
    from {{ref("marks_total")}} t


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
    t."total_marks"
from marks t order by t."total_marks" desc
