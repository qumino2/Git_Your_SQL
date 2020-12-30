-- 注意要区分近 30 天是否包括今天
select 
    activity_date as day,
    count(distinct user_id) as active_users

from Activity
where datediff('2019-07-27', activity_date) <= 29
group by activity_date