-- Write your MySQL query statement below
with cte as (
    select id, row_number() over(partition by email order by id) as rn
    from Person
),
src as (
    select id from cte
    where rn = 1
)
delete from Person
where id not in(select id from src)