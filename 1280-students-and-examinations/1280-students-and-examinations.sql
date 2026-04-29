# Write your MySQL query statement below
with subs as (
    select a.student_id, a.student_name, b.subject_name
    from Students a
    inner join Subjects b
)
select a.student_id, a.student_name, a.subject_name,
 sum(case when b.student_id is null then 0 else 1 end) as attended_exams
from subs a
left join Examinations b
on a.student_id = b.student_id
and a.subject_name = b.subject_name
group by a.student_id, a.student_name, a.subject_name
order by a.student_id, a.subject_name