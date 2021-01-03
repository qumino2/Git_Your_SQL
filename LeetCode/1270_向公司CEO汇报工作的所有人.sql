select distinct
    E1.employee_id
from Employees E1, Employees E2, Employees E3
where E1.manager_id = E2.employee_id
and E2.manager_id = E3.employee_id
and E1.employee_id != 1 
and E3.manager_id = 1;