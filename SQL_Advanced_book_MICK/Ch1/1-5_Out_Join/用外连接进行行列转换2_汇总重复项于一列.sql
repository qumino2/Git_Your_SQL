-- P78 例题

-- 注意连接条件是通过 IN 谓词指定的

select EMP.employee, CHILDREN.child
from Personnel EMP
    left outer join CHILDREN
    on CHILDTEN.child in (EMP.child_1, EMP.child_2, EMP.child_3);


