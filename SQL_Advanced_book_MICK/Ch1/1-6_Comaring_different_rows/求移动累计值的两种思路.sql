-- P103 例题

-- 使用窗口函数
select 
    prc_date, 
    prc_amt,
    sum(prc_amt) over (order by prc_date)
                       rows 2 preceding) as onhand_amt
  from Accounts;


-- 使用标量子查询, 如果数据不满 3 行不希望显示，则可以加 having count(*) = 3

SELECT prc_date, A1.prc_amt, 
        (SELECT SUM(prc_amt) 
        FROM Accounts A2 
        WHERE A1.prc_date >= A2.prc_date 
        AND (SELECT COUNT(*) 
                FROM Accounts A3 
                WHERE A3.prc_date BETWEEN A2.prc_date AND A1.prc_date) <= 3) AS mvg_sum 
 FROM Accounts A1 
 ORDER BY prc_date;