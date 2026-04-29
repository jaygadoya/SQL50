# Write your MySQL query statement below
with strt as (
    select machine_id, process_id, activity_type, timestamp
    from Activity
    where activity_type = 'start'
),
end as (
    select machine_id, process_id, activity_type, timestamp
    from Activity
    where activity_type = 'end'
)
select a.machine_id, round(avg(b.timestamp - a.timestamp),3) as processing_time
from strt a
inner join end b
on a.machine_id = b.machine_id
and a.process_id = b.process_id
group by a.machine_id