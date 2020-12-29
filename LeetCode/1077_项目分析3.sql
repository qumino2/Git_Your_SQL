with

exp_rank as (
    select
        Project.project_id,
        Project.employee_id,

        RANK() over (partition by Project.project_id order by experience_years desc) as exp_rank
    from Project
    left join Employee
        on Project.employee_id = Employee.employee_id
)

select 
    project_id, 
    employee_id
from exp_rank
where exp_rank = 1;