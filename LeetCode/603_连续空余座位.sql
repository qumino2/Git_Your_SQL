-- 自己的刚开始的解法，代码长但是思路直观，而且更通用

select C1.seat_id
from cinema C1, cinema C2
where C1.seat_id >= C2.seat_id - 1
and C1.seat_id <= C2.seat_id + 1
and C1.free = '1'
group by C1.seat_id
having sum(case when C2.free = '1' 
                    then 1
                else 0 end) >= 2
order by 1;

-- 优化后代码短，思路不那么直观，也不那么通用，但是 abs 这个写法来约束相邻位置很好

select C1.seat_id
from cinema C1, cinema C2
where abs(C1.seat_id - C2.seat_id) = 1
and C1.free = '1'
and C2.free = '1'
group by C1.seat_id
order by 1;