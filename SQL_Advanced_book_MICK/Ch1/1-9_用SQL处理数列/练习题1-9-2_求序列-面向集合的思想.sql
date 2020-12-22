-- 1-9-2 练习

select 
    S1.seat as start_seat, 
    S2.seat as end_seat
from Seats S1, Seats S2, Seats S3 --注意因为是用 having 写法而不是 not exists, 所以 S3 写这里
where S2.seat = S1.seat + head_cnt - 1 --求S1、S2组合时的条件
and S3.seat between S1.seat and S2.seat -- 处理有序数列时，between 很好用
group by S1.seat, S2.seat
having count(*) = sum(case when S3.status = '未预定' then 1 else 0 end);