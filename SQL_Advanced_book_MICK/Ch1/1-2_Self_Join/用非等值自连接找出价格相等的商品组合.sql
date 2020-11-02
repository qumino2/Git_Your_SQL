-- P28, 例题

select
    distinct p1.name, 
             p1.price
from p1.Products, p2.Products
where p1.name != p2.name
    and p1.price = p2.price

-- 要加 distinct 的原因是价格相同记录的条数如果有超过 2 条的就会出现重复。