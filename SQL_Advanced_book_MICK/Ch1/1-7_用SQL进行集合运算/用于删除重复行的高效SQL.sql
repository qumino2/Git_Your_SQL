-- P 126 例题

-- 用于删除重复行的高效 SQL 语句 (1)：通过 EXCEPT 求补集 
DELETE FROM Products WHERE rowid IN (         SELECT rowid
    -- 全部 rowid FROM Products
EXCEPT
    -- 减去 
    SELECT MAX(rowid) -- 要留下的 
rowid
    FROM Products
    GROUP BY name, price)
;


-- 删除重复行 ：使用关联子查询 
DELETE FROM Products WHERE rowid < ( SELECT MAX(P2.rowid)
                                    FROM Products P2
                                    WHERE Products.name = P2. name 
                                    AND Products.price = P2.price ) ;