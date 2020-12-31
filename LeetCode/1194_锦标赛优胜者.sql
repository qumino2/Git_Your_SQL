with 

player_scores as (
    select 
        first_player as player_id,  
        first_score as scores
    from Matches
    union all
    select 
        second_player,
        second_score
    from Matches
),

player_score_total as (
    select 
        player_scores.player_id,
        group_id,
        sum(scores) as score_total
    from player_scores
    left join Players
        on player_scores.player_id = Players.player_id
    group by 1, 2
),

player_score_total_rank as (
    select 
        group_id,
        player_id,

        rank() over (partition by group_id order by score_total desc, player_id) as rk
    from player_score_total
)

select 
    group_id,
    player_id
from player_score_total_rank
where rk = 1;