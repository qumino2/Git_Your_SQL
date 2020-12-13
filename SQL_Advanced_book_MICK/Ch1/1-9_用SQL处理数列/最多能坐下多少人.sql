-- P159 例题

-- 第一阶段：生成存储了所有序列的视图
CREATE VIEW Sequence (start_seat, end_seat, seat_cnt) as
select 
    S1.seat as start_seat, 
    S2.seat as end_seat, 
    S2.seat - S1.seat + 1 as seat_cnt
from Seats S1, Seats S2
where S1.seat < S2.seat
and not exists
        (select * 
          from Seats S3
          where (S3.seat between S1.seat and S2.seat
            and S3.seat <> '未预定')
            or 
            (S3.seat = S1.seat - 1 and S3.seat = '未预定')
            or
            (S3.seat = S2.seat + 1 and S3.seat = '未预定'));

-- 第二阶段：求最长的列
select 
    start_seat,
    end_seat,
    seat_cnt
from Sequence 
where seat_cnt = (select max(seat_cnt
                  from Sequence)