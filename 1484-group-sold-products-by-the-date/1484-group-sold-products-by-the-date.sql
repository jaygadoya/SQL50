# Write your MySQL query statement below
with src as (
    select distinct sell_date, product from Activities
    )
select sell_date,  count(product) as num_sold, group_concat(product order by product separator ',') as products
from src
group by sell_date
order by sell_date