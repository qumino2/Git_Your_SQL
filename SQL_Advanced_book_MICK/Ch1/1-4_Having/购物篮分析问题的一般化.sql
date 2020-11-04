-- P71 练习题1-4-3

select 
    SI.shop,
    count(SI.item) as my_item_cnt,
    (select count(item) from Items) - count(I.item) as diff_cnt
from ShopItems SI  inner join Items I
  on SI.item = I.item
 group by SI.shop;