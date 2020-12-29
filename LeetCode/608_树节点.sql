with

p_ids as (
    select 
        p_id
    from tree
    where p_id is not null -- 如果不加这个条件，null 也会被算作一个 group
    group by p_id
)

select 
    id,

    case when p_id is null
            then "Root"
         when p_id is not null and id in (select * from p_ids)
            then "Inner"
         else "Leaf"
    end as Type

from tree;


-- 其实上面的 CTE 对于解这道题有点多余，但是写出来会更清晰。