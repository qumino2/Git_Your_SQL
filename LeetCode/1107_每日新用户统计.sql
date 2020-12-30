-- 每一个 CTE 是一个独立的逻辑单元，being stupid 而不是 being smart
with 

all_firstLogins as (
    select distinct 
        user_id,
        min(activity_date) as login_date

    from traffic
    where activity = 'login'
    group by user_id
),

final as (
    select 
        login_date,
        count(user_id) as user_count

    from all_firstLogins
    where datediff('2019-06-30', login_date) <= 90
    group by 1
)

select * from final