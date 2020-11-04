-- P71 练习题1-4-2

select 
    dpt
  from Students
 group by dpt
having count(*) = sum(case when sbmt_date is not null
                           then 1
                           else 0 end)
and max(sbmt_date) < '2005-10-01';


-- key1

SELECT dpt 
FROM Students 
GROUP BY dpt 
HAVING COUNT(*) = SUM(CASE WHEN sbmt_date BETWEEN '2005-09-01' AND '2005-09-30' THEN 1 ELSE 0 END);

-- key2

SELECT dpt 
FROM Students 
GROUP BY dpt 
HAVING COUNT(*) = SUM(CASE WHEN EXTRACT (YEAR FROM sbmt_date) = 2005 AND EXTRACT (MONTH FROM sbmt_date) = 09 THEN 1 ELSE 0 END);