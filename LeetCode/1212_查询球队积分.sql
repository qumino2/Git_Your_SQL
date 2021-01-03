 with

matches_scores as (

    select 
        *,
        case when host_goals > guest_goals
                then 3
             when host_goals = guest_goals
                then 1
             else 0 
        end as host_score,

        case when host_goals > guest_goals
                then 0
             when host_goals = guest_goals
                then 1
             else 3
        end as guest_score

    from Matches
),

teams_scores as (

    select 
        host_team as team_id,
        host_score as point
    from matches_scores
    union all 
    select 
        guest_team,
        guest_score
    from matches_scores 
)

select 
    teams.team_id,
    teams.team_name,
    coalesce(sum(point), 0) as num_points 

from teams_scores 
right join teams
    on teams_scores.team_id = teams.team_id
group by teams.team_id
order by num_points desc, teams.team_id;