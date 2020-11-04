-- P66 例题

-- 带余关系除法运算
select 
    SI.shop
  from ShopItems SI, Item I
 where SI.item = I.item    
 group by SI.shop
having count(SI.item) = (select count(item) from Items); 


-- 精确关系除法运算, 要用外连接保留信息
select 
    SI.shop
from ShopItems left outer join Items I
  on SI.item = I.item
 group by SI.shop
having count(SI.item) = (select count(item) from Items)
   and count(I.item) = (select count(item) from Items);




