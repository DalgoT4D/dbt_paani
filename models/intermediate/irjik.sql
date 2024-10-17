{{ config(materialized='table') }}

with irjik as (

    select *
    FROM staging."irjik_table"

)


select *
from irjik