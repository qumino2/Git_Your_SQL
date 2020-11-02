-- P35 练习题1-2-1

select 
    P1.name as name_1,
    P2.name as name_2
from Products P1, Products P2
where P1.name > P2.name

-- 注意可能的四种情况：可重排列，排列，可重组合，组合