-- P184 练习题 1-10-2

select 
    student_id
from TestScore
group by student_id
having 2 = sum(case when subject = '数学' and score >= 80 then 1
                    when subject = '语文' and score >= 50 then 1
                else 0 end);