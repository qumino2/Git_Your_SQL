-- 解法一
select distinct
    player_id,
    min(event_date) over (partition by player_id order by event_date) as first_login
from Activity

-- 解法二
select 
    player_id,
    min(event_date) as first_login
from Activity
group by player_id