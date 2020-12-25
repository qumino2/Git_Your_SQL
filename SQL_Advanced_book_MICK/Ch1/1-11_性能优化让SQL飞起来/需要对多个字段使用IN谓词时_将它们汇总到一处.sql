-- p198 例题

-- 不好
SELECT id, state, city
FROM Addresses1 A1 WHERE state IN (SELECT state FROM Addresses2 A2 WHERE A1.id = A2.id) AND city IN (SELECT city FROM Addresses2 A2 WHERE A1.id = A2.id);

-- 好
SELECT *
FROM Addresses1 A1 WHERE id || state || city
IN (SELECT id || state|| city
FROM Addresses2 A2);

-- 最好，如果数据库支持行与行的比较
SELECT *
FROM Addresses1 A1 WHERE (id, state, city)
IN (SELECT id, state, city
FROM Addresses2 A2);