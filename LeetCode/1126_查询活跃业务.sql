with

event_type_avg as (
    select *,
        avg(occurences) over (partition by event_type) as event_type_avg
    from Events
)

select
    business_id
from event_type_avg
group by business_id
having sum(case when occurences > event_type_avg then 1 else 0 end) >= 2;