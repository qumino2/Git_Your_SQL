--首先这题意义不大，SQL不是用来做格式转换的。这里的关键是 group by

with

ordered_student as (
    select 
        name, 
        continent, 
        row_number()over(partition by continent order by name) row_num
    from student
)

select
    max(case when continent = "America"
            then name 
         else null
    end) as America,

    max(case when continent = "Asia"
            then name
         else null
    end) as Asia,
git
    max(case when continent = "Europe"
            then name
         else null
    end) as Europe
from ordered_student
group by row_num;