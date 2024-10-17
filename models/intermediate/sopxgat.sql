{{ config(materialized='table') }}

with sopdata as (

    select distinct *
    FROM {{ref("sop_tab")}}
),

gat_data as (
    select * from {{ref("gat")}} t
)

select s.*, t."Farmers_Count" 
from sopdata s 
left join gat_data t ON s."Gat_No" = t."Gat_Serial_No" order by "Gat_No"




