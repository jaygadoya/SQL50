# Write your MySQL query statement below
select a.product_id as product_id, case when round(sum((a.price*case when b.units is null then 0 else b.units end))/sum(b.units),2) is null then 0 else  round(sum((a.price*case when b.units is null then 0 else b.units end))/sum(b.units),2) end as average_price
from Prices a
left join (select distinct product_id, purchase_date, units from UnitsSold) b
on a.product_id = b.product_id
and b.purchase_date between a.start_date and a.end_date
and b.product_id is not null
group by a.product_id
