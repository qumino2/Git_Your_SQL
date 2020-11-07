-- P111 练习题1-6-3

-- 窗口函数版，MAX() MIN() AVG() 分别可以求出各值
SELECT prc_date, prc_amt, MAX(prc_amt) OVER (ORDER BY prc_date) AS onhand_max
FROM Accounts;

