-- P123 例题

SELECT SP1.sup AS s1, SP2.sup AS s2
FROM SupParts SP1, SupParts SP2
WHERE SP1.sup < SP2.sup -- 利用非等值连接生成供应商的全部组合

    AND SP1.part = SP2.part -- 条件 1 ：经营同种类型的零件 
    GROUP BY SP1.sup, SP2.sup HAVING COUNT(*) = (SELECT COUNT(*) -- 条件 2 ：经营的零件种类数相同 
    FROM SupParts SP3 WHERE SP3.sup = SP1.sup)

    AND COUNT(*) = (SELECT COUNT(*)
    FROM SupParts SP4
    WHERE SP4.sup = SP2.sup);