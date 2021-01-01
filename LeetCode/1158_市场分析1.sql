-- join 之前最好先 aggregatee
with 

buyer_orderNum_2019 as (
    select 
        buyer_id,
        count(order_id) as orderNum
    from Orders
    where extract(year from order_date) = '2019'
    group by buyer_id
)

select 
    user_id as buyer_id,
    join_date,
    coalesce(orderNum, 0) as orders_in_2019

from Users
left join buyer_orderNum_2019
    on Users.user_id = buyer_orderNum_2019.buyer_id;