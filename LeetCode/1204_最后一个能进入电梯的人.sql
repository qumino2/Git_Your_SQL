-- 用自连接也代替窗口函数，下面的非等值自连接很妙

select
    q1.person_name
from Queue q1, Queue q2
where q1.turn >= q2.turn
group by q1.turn
having sum(q2.weight) <= 1000
order by q1.turn desc
limit 1



-- 窗口函数
with 

total_weight_so_far as (
    select *,
        sum(weight) over (order by turn) as total_weight_so_far
    from Queue
)

select 
    person_name

from total_weight_so_far
where turn = (select max(turn) 
                from total_weight_so_far 
                where total_weight_so_far <= 1000);