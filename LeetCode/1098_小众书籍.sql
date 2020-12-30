-- 用 not exists 做
select 
    book_id,
    name
from Books 
where datediff('2019-06-23', available_from) > 30
and not exists (
            select
                *
            from Orders
            where dispatch_date between '2018-06-23' and '2019-06-23'
            and Orders.book_id = Books.book_id
            group by Orders.book_id
            having sum(quantity) >= 10
);

-- 也可以用 books 表 left join orders 表 (因为没有订单的书籍也要显示)，注意处理下 null