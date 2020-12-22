-- 由于 SQL 因为 null 的关系，是三值逻辑，null < 1000 的值是 unknown，所以碰到 null 条件反射的先用 coalesce()函数处理 null。

select 
    e.name,
    b.bonus
from 
    Employee e
left join Bonus b
on e.empId = b.empId
where coalesce(b.bonus, 0) < 1000;


-- 如果不处理，要返回 true 值，则要用 is (not) null 来进行条件判断



select 
    e.name,
    b.bonus
from 
    Employee e
left join Bonus b
on e.empId = b.empId
where b.bonus < 1000 or b.bonus is null;

