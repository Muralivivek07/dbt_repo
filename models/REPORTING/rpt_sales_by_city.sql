{{config(materialized='view',schema='reporting')}}
select 
c.customerid, c.contactname,c.city ,sum(linesaleamount) as sales ,sum(o.quantity) as quantity,
avg(o.margin) as margin from
{{ref('dim_customers')}} as c inner join
{{ref('fct_orders')}} as o on c.customerid=o.customerid
where c.city={{(var('vcity',"'London'"))}}
group by c.customerid, c.contactname,c.city 
order by sales desc