--select 里要加 distinct 因为同一个有可能在不同日子都满足条件
select distinct
    viewer_id as id
from Views
group by viewer_id, view_date
having count(distinct article_id) >= 2
order by 1;