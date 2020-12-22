--解法一：窗口函数

select 
    player_id,
    event_date,
    sum(games_played) over (partition by player_id order by event_date) as games_played_so_far
from Activity

--解法二：也可以用自连接，但是不要忘记 group by, order by 

select 
    A1.player_id,
    A1.event_date,
    sum(A2.games_played) as games_played_so_far
from Activity A1, Activity A2
where A1.player_id = A2.player_id
and A2.event_date <= A1.event_date
group by A1.player_id, A1.event_date
order by A1.player_id, A1.event_date