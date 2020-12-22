-- SQL是面向集合的语言，既然涉及第二天登录，就要想如果所有用户第二天都登录，这个集合是怎么样的。

select 
    round(count(distinct player_id) / (select count(distinct player_id) from Activity), 2) as fraction
from
    Activity
where (player_id, event_date) 
    in (
    select 
        player_id, 
        date(min(event_date) + 1)
    from Activity
    group by player_id)
)