select 
    class
from 
    TestResults
group by class
having sum(case when score >= 80 then 1 else 0 end) / count(*) * 1.0 >= 0.75 