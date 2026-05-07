# Write your MySQL query statement below
with req as (
    select requester_id as id, count(*) as num
    from RequestAccepted
    group by requester_id
    union all
    select accepter_id as id, count(*) as num
    from RequestAccepted
    group by accepter_id
), summed as (
    select id, sum(num) as num
    from req
    group by id
)
select id, num
from summed
where num = (select max(num) from summed)