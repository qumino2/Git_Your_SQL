-- 155 例题

--座位全部都在一排
select 
    S1.seat as start_seat, 
    S2.seat as end_seat
from Seats S1, Seats S2
where S2.seat = S1.seat + (head_cnt - 1) --这里注意要 -1，不然的话会多算一个座位
and not exists
            (select *
              from Seats S3
              where S3.seat between S1.seat and S2.seat
              and S3.status <> '未预定');

-- 如果座位是换排的话，只需要再多加一个条件即可

select 
    S1.seat as start_seat, 
    S2.seat as end_seat
from Seats S1, Seats S2
where S2.seat = S1.seat + (head_cnt - 1) --这里注意要 -1，不然的话会多算一个座位
and not exists
            (select *
              from Seats S3
              where S3.seat between S1.seat and S2.seat
              and S3.status <> '未预定'
              or S3.row_id <> S1.row_id);