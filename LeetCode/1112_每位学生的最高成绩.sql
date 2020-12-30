-- 注意字段命名避免用 rank, 会和关键字冲突报错
with 

enroll_ranks as (
    select 
        student_id,
        course_id,
        grade,
        rank()over(partition by student_id order by grade desc,course_id) as rk 
    from Enrollments 
)

select 
    student_id,
    course_id,
    grade

from enroll_ranks
where rk = 1