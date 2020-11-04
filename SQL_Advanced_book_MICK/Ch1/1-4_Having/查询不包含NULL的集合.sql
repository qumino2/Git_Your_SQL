-- P63 例题

-- 利用了 count(*) 和 count(列名) 在查询含 NULL 集合时结果不一致的特性

select 
    dpt
  from Students
 group by dpt
having count(*) = sum(case when sbmt_date is not null
                           then 1
                           else 0 end);

                           