--自己的解法

with 

user1_friends as (

    select 
        case when user1_id = 1 
                then user2_id
             when user2_id = 1
                then user1_id
             else null
        end as friend_id
    from Friendship
)

select distinct
    page_id as recommended_page
from user1_friends
inner join Likes
    on user1_friends.friend_id = Likes.user_id
where page_id not in (select page_id 
                      from Likes 
                      where user_id = 1);

-- 用 in 来筛选页挺好

select distinct page_id as recommended_page
from likes
where user_id in(select user2_id from friendship where user1_id = 1
                 union
                 select user1_id from friendship where user2_id = 1)
      and page_id not in (select page_id from likes where user_id = 1)