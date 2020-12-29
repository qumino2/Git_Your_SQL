-- Any, All 这两个 logical operator 要习惯使用。比如此题需要考虑最大值有多个的情况。

select 
    project_id

from Project
group by project_id
having count(*) >= all(select count(*) from Project group by project_id); 