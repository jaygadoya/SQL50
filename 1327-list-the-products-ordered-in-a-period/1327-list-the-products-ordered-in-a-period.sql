# Write your MySQL query statement below
select a.product_name as product_name, sum(b.unit) as unit from Products a
inner join Orders b
on a.product_id = b.product_id
and b.order_date between '2020-02-01' and '2020-02-29'
group by a.product_name
having sum(b.unit) >= 100