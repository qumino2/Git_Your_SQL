-- P30 例题
-- 如果不依赖窗口函数，如何来添加 rank 排序

-- 子查询所做的就是计算出价格比自己高的记录的条数并将其所为自己的位次，而且如果 count 函数中加 distinct 则达到 dense_rank() 的效果
select 
    P1.name,
    P1.price,
    (select count(P2.price)
       from Products P2
      where P2.price > P1.price) + 1 as rank_1
  from Products P1
  order by rank_1;


-- 上面子查询的代码可以按照自连接的写法来改写

select
    P1.name,
    max(P1.price) as price,
    count(P2.name) + 1 as rank_1
  from Products P1 left outer join Products P2
    on P1.price < P2.price
 group by P1.name
 order by rank_1;

 -- 这里使用外连接就是为了把没有比它价格更高的第一名橘子保留下来，而不是在内连接中被去掉


