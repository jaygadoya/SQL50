# Write your MySQL query statement below
select name from (
select a.id, a.name, count(b.managerId) as cnt
from Employee a
inner join Employee b
on a.id = b.managerId
group by a.Id, a.name
)a
where cnt >= 5