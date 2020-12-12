-- P148 练习题 1-8-2

select * 
from Projects P1
where 'O' = all
                (select case when step_nbr <= 1 and status = '完成' then 'O'
                             when step_nbr > 1 and status = '等待' then 'O'
                             else 'X' end
                 from Projects P2
                 where P1.project_id = P2.project_id); 



-- 我一开始的解法，显示不够优雅，没有灵活使用case表达式

select distinct project_id
from Projects P1
where "完成" = all
        (select status
         from Projects P2
         where P1.project_id = P2.project_id
         and P2.step_nbr <= 1)
and "等待" = all
        (select status
         from Projects P2
         where P1.project_id = P2.project_id
         and P2.step_nbr > 1)
