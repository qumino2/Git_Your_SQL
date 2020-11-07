-- P97 例题 --只要是能用关联子查询做的，也都可以用自连接做


SELECT S1.year, S1.sale,
    CASE WHEN sale = (SELECT sale
    FROM Sales S2
    WHERE S2.year = S1.year - 1) THEN '→' -- 持平 
         WHEN sale > (SELECT sale
    FROM Sales S2
    WHERE S2.year = S1.year - 1) THEN '↑' -- 增长 
         WHEN sale < (SELECT sale
    FROM Sales S2
    WHERE S2.year = S1.year - 1) THEN '↓' -- 减少 
         ELSE '—' END AS var
FROM Sales S1
ORDER BY year;

--自连接解法

SELECT S1.year, S1.sale, 
        CASE WHEN S1.sale = S2.sale THEN '→' 
             WHEN S1.sale > S2.sale THEN '↑' 
             WHEN S1.sale < S2.sale THEN '↓' 
             ELSE '—' 
             END AS var
FROM Sales S1, Sales S2
WHERE S2.year = S1.year - 1
ORDER BY year;