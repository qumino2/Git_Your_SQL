-- 不考虑并列第一

select
    customer_number
from orders
group by customer_number
order by count(order_number) desc
limit 1;


-- 考虑并列第一

select 
    customer_number
from orders
group by customer_number
having count(order_number) = (  select
                                    count(order_number)
                                from orders
                                group by customer_number
                                order by count(order_number) desc
                                limit 1);