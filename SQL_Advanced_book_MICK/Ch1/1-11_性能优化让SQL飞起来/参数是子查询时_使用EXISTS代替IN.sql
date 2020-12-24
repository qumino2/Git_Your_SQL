-- P187 例题

-- 快
select *
from Class_A A
where exists (
        select *
        from Class_B B
        where A.id = B.id
);

-- 如果性能可以，in 的代码更直观，但是最好不写子查询，因此可以用连接来替代
select *
from Class_A 
where id in (
            select id
            from Class_B
);

-- 使用连接代替 IN
select 
    A.id,
    A.name
from Class_A A 
inner join Class_B B
    on A.id = B.id;

