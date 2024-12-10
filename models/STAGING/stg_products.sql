{{config(materialized='table',schema=env_var('DBT_SOURCESCHEMA','STAGING_DEV'))}}

select * from
{{source('qwt_raw','Products')}}