-- 把分散在两列里需要 group 的元素先 union 起来

select 
    id,
    count(*) as num
from (
    select 
        requester_id as id
    from request_accepted
    union all 
    select 
        accepter_id as id
    from request_accepted
) tmp
group by 1
order by 2 desc
limit 1
