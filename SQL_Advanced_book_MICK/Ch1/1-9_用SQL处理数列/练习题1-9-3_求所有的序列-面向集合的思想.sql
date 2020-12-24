CREATE VIEW Sequence (start_seat, end_seat, seat_cnt) as
select
    S1.seat as start_seat, 
    S2.seat as end_seat, 
    S2.seat - S1.seat + 1 as seat_cnt
from seat3 S1, seat3 S2, seat3 S3
where S1.seat <= S2.seat
and S3.seat between S1.seat -1 and S2.seat + 1 -- 这一步非常关键，结合后面 having 的部分
group by S1.seat, S2.seat
having count(*) = sum(case when S3.seat between S1.seat and S2.seat
                                        and S3.status = '未预定' then 1 else 0 end) 
                                        
-- 满足的条件需要涉及起点终点以为的位置，那么count(*) 中要把满足条件的这些位置都算进去
