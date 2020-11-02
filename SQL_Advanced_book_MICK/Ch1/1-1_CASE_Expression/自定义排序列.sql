-- P20, 练习题1-1-3

select 
    key,
    case when x >= y 
         then (case when x >= z
                    then x 
                    else z end)
         else (case when y >= z
                    then y 
                    else z end)
    end as greatest
from Greatets 
order by case when key = B 
              then 1
              when key = A 
              then 2
              when key = D
              then 3
              when key = C
              then 4
              else null end -- 注意 case 一定要养成写 else 的习惯
         end as key_order;
        
-- 注意一般不用这样的查询语句，因为 SQL 的本职工作是查询数据，而对查询结果进行格式化其实是宿主（host enviroment）语言的工作