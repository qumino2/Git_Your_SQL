-- P88 练习题

-- 用外连接求差集 A - B

SELECT A.id AS id, A.name AS A_name
FROM Class_A A LEFT OUTER JOIN Class_B B ON A.id = B.id
WHERE B.name IS NULL;

-- 用外连接进行关系除法运算：差集的应用

SELECT DISTINCT shop
FROM ShopItems SI1
WHERE NOT EXISTS (SELECT I.item
FROM Items I LEFT OUTER JOIN ShopItems SI2 ON I.item = SI2.item AND SI1.shop = SI2.shop
WHERE SI2.item IS NULL) ;