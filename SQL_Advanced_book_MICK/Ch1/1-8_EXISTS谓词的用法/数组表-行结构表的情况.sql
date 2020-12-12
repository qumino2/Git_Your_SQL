-- P147 练习题

-- 答案应该是 C, 但这个解法的答案是 A 和 C
select distinct key
from ArrayTbl2 AT1
where not exists
        (select *)
           from ArrayTbl AT2
          where AT1.key = AT2.key
            and AT2.val <> 1);

-- 这是由 SQL 的缺陷导致的问题，我们在 1-3 节中论述 NOT IN 和 NOT EXISTS 的兼容性时也曾遇到过。在条件为 false 或 unknown 时，子查询 的 SELECT 都会返回空。但是 NOT EXISTS 不区分这两种情况，都会统一 按照“没有返回数据→ true ”来处理。也就是说 SQL 采用了这种奇怪的 设计：SQL 中的谓词大多数都是三值逻辑，唯独 EXISTS 谓词是二值逻辑A 。 因此，为了得到正确的结果，我们必须在子查询的条件中添加 val 为 NULL 的情况。   

-- 正确的解法

select distinct key
from ArrayTbl2 AT1
where not exists
        (select *)
           from ArrayTbl AT2
          where AT1.key = AT2.key
            and （AT2.val <> 1 or AT2.val is null);


-- 解法二 使用 ALL 谓词

select distinct key 
from ArrayTbl A1
where 1 = ALL
        (select val
           from ArrayTbl A2
          where A1.key = A2.key);


-- 解法三 使用 HAVING 子句, 这个加入case表达式的解法可以处理更普遍的问题，如全是9，全是A
select key
from ArrayTbl
group by key
having sum(case when val = 1 then 1 else 0 end) = 10;

                
-- 解法四 使用极值函数
select key
from ArrayTbl
group by key
having max(val) = 1
and min(val) = 1;
