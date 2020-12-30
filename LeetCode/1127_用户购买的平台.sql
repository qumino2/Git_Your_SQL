-- 注意 sum(amount)如果有 null 则结果也会是 null, 而 count(user_id)如果有 null 则会把这条记录排除，如果只有 null 的记录则返回 0 

with 

user_daily_records as (
    
    select
        user_id,
        spend_date,
        sum(amount) as user_total_amount,
        case when count(platform) = 2
                then 'both'
             when platform = 'mobile'
                then 'mobile'
             else 'desktop' 
        end as platform

    from Spending
    group by user_id, spend_date

),

date_platform_cross as (
    
    select distinct 
        spend_date, 'mobile' as platform
    from Spending
    union
    select distinct 
        spend_date, 'desktop' as platform
    from Spending
    union
    select distinct 
        spend_date, 'both' as platform
    from Spending
)
select
    date_platform_cross.spend_date,
    date_platform_cross.platform,
    
    coalesce (sum(user_total_amount), 0) as total_amount,
    count(user_id) as total_users

from date_platform_cross
left join user_daily_records
    on date_platform_cross.spend_date = user_daily_records.spend_date
    and date_platform_cross.platform = user_daily_records.platform
group by 1, 2;