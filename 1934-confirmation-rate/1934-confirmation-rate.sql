# Write your MySQL query statement below
with src as (
    select a.user_id, b.action
    from Signups a
    left join Confirmations b
    on a.user_id = b.user_id
)
select user_id, round(sum(case when action is null or action = 'timeout' then 0 else 1 end) / count(case when action is null then 0 else 1 end),2) as confirmation_rate from src
group by user_id