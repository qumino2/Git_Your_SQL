-- p191 例题

-- 一对多连接出现重复数据，使用 distinct 去重，但是需要排序
select distinct
    I.item_no
from Items 
inner join SalesHistory
    on Items.item_no = SalesHistory.item_no;


-- 更好的做法是使用 Exists

select 
    item_no
from Items 
where exists (
        select * 
        from SalesHistory
        where Item.item_no = SalesHistory.item_no
);