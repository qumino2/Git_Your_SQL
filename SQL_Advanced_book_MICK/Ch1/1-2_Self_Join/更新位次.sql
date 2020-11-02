-- P37 练习题1-2-3

--自连接解法, 注意 update 数据库的语法

UPDATE DistrictProducts2 P1
   SET ranking = (select
                    count(P2.price) + 1
                 from DistrictProducts2 P2
                 where P1.district = P2.district
                   and P2.price > P1.price);

UPDATE DistrictProducts2
   SET ranking = rank() over (partition by district
                              order by price desc);

    
