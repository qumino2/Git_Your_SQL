-- not exists 解法
-- 这个答案虽然通过了，但是有疑问：为什么c2.referee_id 为 null 因为 where 语句的结果是 unknown 时也会返回这些记录？
select 
    c1.name
from customer c1
where not exists (
            select *
            from customer c2
            where c1.id = c2.id
            and c2.referee_id = 2
);

-- 也可以先用 coalesce() 处理 null