-- 注意 MySQL 的 date format 函数
select distinct
    date_format(pay_date, '%Y-%m') as pay_month,
    department_id,

    case when avg(amount) over (partition by pay_date, department_id) > 
              avg(amount) over (partition by pay_date)
            then "higher"
         when avg(amount) over (partition by pay_date, department_id) < 
              avg(amount) over (partition by  pay_date)
            then "lower"
         else "same"
    end as comparison
from salary
inner join employee
    on salary.employee_id = employee.employee_id;