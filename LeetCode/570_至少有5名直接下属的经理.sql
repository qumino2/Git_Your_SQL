需要搞懂多种解法 以及 null 的处理
--解法一，自连接
select  
    e1.Name
from 
    Employee e1 inner join Employee e2
    on e1.Id = e2.ManagerId
group by e1.Id
having count(*) >= 5



--解法二，使用子查询，不推荐写子查询
select name
from Employee 
where id in (
    select ManagerId
    from Employee
    group by ManagerId
    having count(ManagerId) >= 5 
)