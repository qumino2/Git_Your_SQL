-- P121 例题

-- 解题思考是先把处理单位分割成了以员工为单位，而关联子查询是 SQL 能够实现类似面向过程语言中循环的功能
SELECT DISTINCT emp
FROM EmpSkills ES1
WHERE NOT EXISTS (    SELECT skill
    FROM Skills
EXCEPT
    SELECT skill
    FROM EmpSkills ES2
    WHERE ES1.emp = ES2.emp);