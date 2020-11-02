-- P17，例题
-- 高手用 case 表达式在 select 子句中进行条件分支，新手用 having 进行条件分支
-- 作为表达式， CASE 表达式在执行时会被判定为一个固定值，因此它 可以写在聚合函数内部；也正因为它是表达式，所以还可以写在 SELECE 子句、 GROUP BY 子句、 WHERE 子句、 ORDER BY 子句里。简单点说，在能 写列名和常量的地方，通常都可以写 CASE 表达式。


select std_id,
       case when count(*) = 1 
            then max(club_id)
            else max(case when main_club_flg = 'Y'
                          then club_id
                          else null end)
        end as main_club
from Studentclub
group by std_id;

