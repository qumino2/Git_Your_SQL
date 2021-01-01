with 

seller_item_rank_by_date as (
    select 
        seller_id,
        item_id,
        order_date,
        rank() over (partition by seller_id order by order_date) as rk

    from Orders
    
),

seller_second_item_brand as (
    select 
        seller_id,
        item_brand
    from seller_item_rank_by_date
    left join Items
        on seller_item_rank_by_date.item_id = Items.item_id
    where rk = 2   
)

select 
    user_id as seller_id,
    case when Users.favorite_brand = seller_second_item_brand.item_brand
            then 'yes'
         else 'no'
    end as '2nd_item_fav_brand'

from Users
left join seller_second_item_brand 
    on Users.user_id = seller_second_item_brand.seller_id;