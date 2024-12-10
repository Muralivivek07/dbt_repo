{{config(materialized='table',schema='transforming')}}

select
 
GET(XMLGET(supliers_info, 'SupplierID'), '$') as SupplierID,
GET(XMLGET(supliers_info, 'CompanyName'), '$')::varchar as CompanyName,
GET(XMLGET(supliers_info, 'ContactName'), '$')::varchar as ContactName,
GET(XMLGET(supliers_info, 'Address'), '$')::varchar as Address,
GET(XMLGET(supliers_info, 'City'), '$')::varchar as City,
GET(XMLGET(supliers_info, 'PostalCode'), '$')::varchar as PostalCode,
GET(XMLGET(supliers_info, 'Country'), '$')::varchar as Country,
GET(XMLGET(supliers_info, 'Phone'), '$')::varchar as Phone,
GET(XMLGET(supliers_info, 'Fax'), '$')::varchar as Fax
 
from
 
{{ref('stg_supliers')}}