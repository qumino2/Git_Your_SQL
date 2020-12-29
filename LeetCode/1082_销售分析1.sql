-- 注意销售类型表中 unit price 和 price 区别
select
    seller_id

from Sales
group by seller_id
having sum(price) >= all(select sum(price) from Sales group by seller_id);