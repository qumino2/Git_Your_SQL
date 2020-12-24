select class
from TestResults
group by class
having avg(case when sex = '男'
                then score
                else null end) --这里 else null 而不是 0 是因为如果这个班级不存在男生，用 null 来表示
      < avg(case when sex = '女'
                 then score
                 else null end);



