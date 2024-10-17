{{
    config(
        indexes=[{"columns": ["_airbyte_raw_id"], "type": "hash"}],
        materialized="table",
    )
}}

{{
    flatten_json(
        model_name=source("source_paani", "Majha_Gat_Majhe_Kutumb"),
        json_column="data",
    )
}}

