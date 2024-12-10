{{config(materialized='table',schema=env_var('DBT_SOURCESCHEMA','STAGING_DEV'))}}

select 
CustomerID ,
CompanyName ,
ContactName ,
City ,
Country ,
DivisionID ,
Address ,
Fax ,
Phone ,
PostalCode ,
StateProvince as State
 from {{source('qwt_raw','customers')}}