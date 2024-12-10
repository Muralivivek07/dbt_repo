{{config(materialized='table',schema='transforming')}}

select 
emp.empid,
emp.last_name,
emp.first_name,
emp.title,
emp.hire_date,
emp.extension,
iff(mgr.first_name is null ,emp.first_name,mgr.first_name) as manager,
emp.salary,
off.officecity,
off.officecountry

from
{{ref("stg_employee")}} as emp left join
{{ref("stg_employee")}} as mgr
on emp.reports_to=mgr.empid
inner join
{{ref('lkp_offices')}} as off
on
emp.office=off.office
