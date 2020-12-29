with 

numFollowers as (
    select 
        followee,
        count(distinct follower) as num
    from follow
    group by 1
)

select distinct
    follower,
    num
from follow
inner join numFollowers
    on follow.follower = numFollowers.followee
order by 1;