-- 解法一，窗口函数
select
    Id,
    Month as month, 

    sum(Salary) over (
        partition by Id
        order by Month
        rows 2 preceding
    ) as Salary

from Employee
where (Id, Month) not in (select Id, max(Month) from Employee group by Id)
order by Id, Month desc




-- 解法二，自连接
-- 用窗口函数可以做的，用自连接也都可以做，因为自连接时第二张表就是提供一个窗口即集合来与第一张表的每一行相对应

select 
    E1.Id,
    E1.Month as month

    sum(E2.Salary) as Salary

from Employee E1, Employee E2
where E1.Id = E2.Id
and E1.Month >= E2.Month
and E1.Month <= E2.Month + 2
and (E1.Id, E1.Month) not in (select Id, Max(Month) from Employee group by Id)
group by 1, 2
order by 1, 2 desc;
