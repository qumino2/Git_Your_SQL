
select 
    case when count(num) = 1 
            then num
         else null
    end as num
from my_numbers
group by num
order by num desc
limit 1