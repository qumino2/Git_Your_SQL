-- P168 例题

--解法一，用 not exists

select 
    team_id, 
    member
from 
    Teams T1
where not exists (
    select * 
    from Team T2
    where T1.team_id = T2.team_id
    and T2.status <> '待命'
);

--解法二，用 having

select 
    team_id
from 
    Teams
group by team_id
having count(*) = sum(case when status = '待命'
                           then 1
                           else 0 end);


--解法三，最大最小值一样，那么肯定只有一种值；可以用 case 把条件放到 select 语句中，这样能一目了然的显示信息

select 
    team_id
from 
    Teams
group by team_id
having max(status) = '待命'
and min(status) = '待命';

