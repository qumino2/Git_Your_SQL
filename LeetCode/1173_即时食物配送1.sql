--最优雅的解法是逻辑真值
select round(
    sum(order_date=customer_pref_delivery_date) /
    count(*)
    ,4)*100
as immediate_percentage
from Delivery



-- percentage 要乘以100
select
    round(sum(case when order_date = customer_pref_delivery_date 
                then 1
             else 0 end) /
    count(*)*100, 2) as immediate_percentage
        
from Delivery;