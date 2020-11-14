-- P129 练习题 1-7-2

SELECT DISTINCT emp

FROM EmpSkills ES1
WHERE NOT EXISTS (        SELECT skill
        FROM Skills
    EXCEPT
        SELECT skill
        FROM EmpSkills ES2
        WHERE ES1.emp = ES2.emp) 
AND NOT EXISTS (        SELECT skill
        FROM EmpSkills ES3
        WHERE ES1.emp = ES3.emp
    EXCEPT
        SELECT skill
        FROM Skills );