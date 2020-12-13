-- 关键点：1. (player_id, event_date) 可以联合查询 2. 使用 in 这个谓词

select 
    player_id, 
    device_id
from Activity
where (player_id, event_date) in (select player_id, min(event_date) 
                                    from Activity
                                    group by player_id);