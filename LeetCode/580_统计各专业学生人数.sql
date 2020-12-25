-- 注意 count(*) 会把含 null 的行数也算进去，count(student_id) 如果 student_id 为 null 则返回的是 0

select 
    department.dept_name,

    count(student.student_id) as student_number

from department
left join student
    on department.dept_id = student.dept_id
group by 1
order by 2 desc, 1