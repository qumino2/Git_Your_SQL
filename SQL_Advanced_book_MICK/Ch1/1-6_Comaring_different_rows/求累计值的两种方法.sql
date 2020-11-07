-- P101 例题

-- 用窗口函数

SELECT prc_date, prc_amt, SUM(prc_amt) OVER (ORDER BY prc_date) AS onhand_amt
FROM Accounts;

-- 使用冯·诺依曼型递归集合

SELECT prc_date, A1.prc_amt, (SELECT SUM(prc_amt)
    FROM Accounts A2
    WHERE A1.prc_date >= A2.prc_date ) AS onhand_amt
FROM Accounts A1
ORDER BY prc_date;

