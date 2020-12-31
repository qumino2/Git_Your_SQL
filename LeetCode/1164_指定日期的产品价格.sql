
--自己的解法
with 

newest_price_by_2019_08_16 as (
    select 
        product_id,
        new_price
    from Products 
    where (product_id, change_date) in (select product_id, max(change_date)  
                                                from Products 
                                                where change_date <= '2019-08-16'
                                                group by product_id)
    

)

select 
    product_ids.product_id,
    case when new_price is null 
        then 10
         else new_price
    end as price

from (select distinct product_id from Products) product_ids
left join newest_price_by_2019_08_16
    on product_ids.product_id = newest_price_by_2019_08_16.product_id;

-- union 的思维自己还是比较欠缺，不太能想到用这种方式处理问题
(select product_id as product_id,10 as price 
from Products 
group by product_id
having min(change_date)>'2019-08-16')
union
(select product_id,new_price as price 
from Products 
where (product_id,change_date) in
                                (select product_id,max(change_date) as max_date
                                 from Products
                                 where change_date<='2019-08-16'
                                 group by product_id))