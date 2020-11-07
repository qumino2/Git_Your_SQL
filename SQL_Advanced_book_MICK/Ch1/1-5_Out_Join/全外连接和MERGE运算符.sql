-- P93 练习题 1-5-3

MERGE INTO Class_A A
    USING (select *
from Class_B ) B
    ON (A.id = B.id)
       when matched then 
        update set A.name = B.name
    when not matched then
        insert (id, name)  
        values (B.id, B.name);