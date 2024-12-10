{{config(materialized='view',schema='reporting')}}

select 
c.companyname,
c.contactname,
count(o.orderid) as totalorders,
avg(o.margin) as avgmargin,
max(o.orderdate) as recent_order_date,
min(o.orderdate) as last_order_date,
sum(o.linesaleamount) as totalsales
from
{{ref('dim_customers')}} as c inner join {{ref('fct_orders')}} as o 
on c.customerid=o.customerid
group by c.companyname,c.contactname
order by totalsales desc