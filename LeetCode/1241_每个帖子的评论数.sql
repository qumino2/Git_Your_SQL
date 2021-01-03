with 

number_of_comments as (
    select 
        parent_id,
        count(distinct sub_id) as number_of_comments

    from Submissions
    where parent_id is not null
    group by parent_id
),

posts as (
    select distinct 
        sub_id
    from Submissions
    where parent_id is null
)

select 
    posts.sub_id as post_id,
    coalesce(number_of_comments, 0) as number_of_comments

from posts
left join number_of_comments
    on posts.sub_id = number_of_comments.parent_id
group by post_id
order by post_id;