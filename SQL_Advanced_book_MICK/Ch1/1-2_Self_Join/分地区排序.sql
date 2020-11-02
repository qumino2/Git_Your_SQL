-- P36 练习题1-2-2

--窗口函数解法

select
    district,
    name,
    price,
    rank() over (partition by district 
                 order by price desc) as rank_1
from DistrictProducts

--标量子查询解法

select
    P1.district,
    P1.name,
    P1.price,
    (select
        count(P2.price)
       from DistrictProducts P2
       where P2.district = P1.district
        and P2.price > P1.price) + 1 as rank_1
from DistrictProducts P1;


--用自连接解法

select
    P1.district,
    P1.name,
    max(P1.price),
    count(P2.price) + 1 as rank_1
from DistrictProducts P1 left outer join DistrictProducts P2
where P1.district = P2.district
  and P1.price < P2.price
group by P1.district, P1.name;
