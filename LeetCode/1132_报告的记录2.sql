-- 求平均的口径注意，有不同的求法
with

daliy_spam_num as (
    select 
        action_date,
        count(distinct Actions.post_id) as num_spams,
        count(distinct Removals.post_id) as num_removals,
        count(distinct Removals.post_id)/
               count(distinct Actions.post_id) as daily_percent

        
    from Actions left join Removals
        on Actions.post_id = Removals.post_id
    where action = 'report'
    and extra = 'spam'
    group by action_date
)

select 
    round(avg(daily_percent)*100, 2) as average_daily_percent

from daliy_spam_num;