-- 判断三角形，任意两边之和大于第三边满足了，任意两边之差小于第三边也肯定满足。这两个条件是等价的。

select 
    x,
    y,
    z,
    case when x + y <= z or x + z <= y or y + z <= x
            then "No"
         else "Yes"
    end as triangle
from triangle;