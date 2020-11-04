-- P62 例题

-- 没有完全理解

select
    avg(distinct income)
  from (select T1.income
          from Graduates T1, Graduates T2
         group by T1.income
         -- S1的条件
         having sum(case when T2.income >= T1.income then 1 else 0 end)
                    >= count(*) / 2
            and sum(case when T2.income <= T1.income then 1 else 0 end)
                    >= count(*) / 2) TMP;