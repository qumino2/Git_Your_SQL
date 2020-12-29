-- 注意可以用 not in 来反选

select 
    distinct buyer_id
from Product
inner join sales
    on Product.Product_id = sales.Product_id
where buyer_id not in (
    select buyer_id
    from Product
    inner join sales
        on Product.Product_id = sales.Product_id
    and Product_name = "iPhone"
    
)
and Product_name = "S8"
;