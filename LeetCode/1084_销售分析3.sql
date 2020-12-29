
--更好的解法，sum()这样的用法可以处理更灵活的问题
select 
    Product.product_id,
    Product.product_name

from Sales
inner join Product
    on Sales.product_id = Product.product_id
group by product_id
having sum(sale_date < '2019-01-01') = 0
    and sum(sale_date < '2019-03-31') = 0;



--自己一开始的解法
select 
    Product.product_id,
    Product.product_name

from Sales
inner join Product
    on Sales.product_id = Product.product_id
group by product_id
having min(sale_date) >= "2019-01-01"
    and max(sale_date) <= "2019-03-31";