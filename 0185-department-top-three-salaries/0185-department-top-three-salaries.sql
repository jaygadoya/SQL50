# Write your MySQL query statement below
with src as (
    select d.name as Department, e.name as Employee, e.salary as Salary, dense_rank() over(partition by d.name order by e.salary    desc) rn
    from Employee e
    inner join Department d
    on e.departmentId = d.id
)
select Department, Employee, Salary
from src
where rn <= 3