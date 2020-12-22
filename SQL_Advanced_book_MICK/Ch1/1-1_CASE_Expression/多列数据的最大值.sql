-- P19, 练习题1-1-1
-- case 表达式可以嵌套是因为在执行时会被解析成标量值

select 
    key,
    case when x >= y 
         then (case when x >= z
                    then x 
                    else z end)
         else (case when y >= z
                    then y 
                    else z end)
    end as greatest
from Greatets;




-- 如果列数增加到 4 列或以上时，再用这种办法 case 就嵌套得太深，所以可以先进行行列转换，再用 max 函数求解

-- 转换成行格式后使用 MAX 函数 

SELECT 
    key, 
    MAX(col) AS greatest 
FROM (SELECT key, x AS col FROM Greatests 
        UNION ALL 
      SELECT key, y AS col FROM Greatests 
        UNION ALL SELECT key, z AS col FROM Greatests)TMP 
GROUP BY key;

-- 如果是 Oracle 或者 MySQL 数据库，那么直接可以用 GREATEST / LEAST 函数求解

select 
    key,
    greatest(greatest(x,y), z) as greatest
from greatests;
