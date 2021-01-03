--自己的解法

select
    employee_id, 
    team_size
from Employee
left join (select team_id, count(*) as team_size from Employee group by team_id) tmp
    on Employee.team_id = tmp.team_id;

--更好的解法是用 team_id 进行自连接

select 
    e1.employee_id, 
    count(*) team_size
from employee e1 left join employee e2
    on e1.team_id = e2.team_id
group by e1.employee_id;