-- 中位数解法一，不用内置函数，巧用非等值自连接和 having

select Id, Company, Salary
from Employee 
where Id in (
    select e1.Id
    from Employee e1, Employee e2
    where e1.Company = e2.Company
    group by e1.Id
    having sum(case when e1.salary >= e2.salary then 1 else 0 end) >= count(*)/2 and sum(case when e1.salary <= e2.salary then 1 else 0 end) >= count(*)/2
)
group by Company, Salary
order by Company, Salary

-- 解法二，用内置函数，更直观的解法


SELECT id, company, salary
FROM
(
    SELECT id, company, salary,
    ROW_NUMBER() OVER (PARTITION BY company ORDER BY Salary ASC, id ASC) AS row_num,
    COUNT(Id) OVER (PARTITION BY company) AS count_id
    FROM Employee
)
WHERE row_num IN (FLOOR((count_id + 1)/2), FLOOR((count_id + 2)/2))

-- 作者：wang-wei-45
-- 链接：https://leetcode-cn.com/problems/median-employee-salary/solution/jian-dan-yi-dong-row-number-count-partition-by-by-/
-- 来源：力扣（LeetCode）
-- 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

-- 解法三，直接用 median() 函数