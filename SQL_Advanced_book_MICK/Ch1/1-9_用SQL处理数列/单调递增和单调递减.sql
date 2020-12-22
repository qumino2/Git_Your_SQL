-- P163 例题，求单调递增区间

-- 第一步先通过自连接把起点和终点的组合找出来
select 
    S1.deal_date as start_date,
    S2.deal_date as end_date
from MyStock S1, MyStock S2
where S2.end_date > S1.start_date

-- 描述起点和终点之间的所有点需要满足的条件, 注意：1. 因为要取区间内的两个点，所以要增加两个集合 S3 和 S4; 2. 处理有序集合时 between 谓词很好用
and not exists
        (select *
         from MyStock S3, MyStock S4
         where S3.deal_date between S1.deal_date and S2.deal_date
         and S4.deal_date between S1.deal_date and S2.deal_date
         and S3.deal_date < S4.deal_date
         and S3.deal_date >= S4.deal_date);

-- 注意解答到这里还没完，因为输出中不一定是满足条件的”最长“的组合, 所以整体的解法如下：

select min(start_date) as start_date,
       end_date
from
    (select S1.deal_date as start_date, 
        max(S2.deal_date) as end_date
    from (
            select 
                S1.deal_date as start_date,
                S2.deal_date as end_date
            from MyStock S1, MyStock S2
            where S2.end_date > S1.start_date
            and not exists
                    (select *
                    from MyStock S3, MyStock S4
                    where S3.deal_date between S1.deal_date and S2.deal_date
                    and S4.deal_date between S1.deal_date and S2.deal_date
                    and S3.deal_date < S4.deal_date
                    and S3.deal_date >= S4.deal_date)
    ) TMP
    group by S1.deal_date)
group by end_date;
        
      
-- 如果需要包含持平（广义的单调递增）的区间，只需要去掉子查询 S3.price >= S4.price 里的等号就可以