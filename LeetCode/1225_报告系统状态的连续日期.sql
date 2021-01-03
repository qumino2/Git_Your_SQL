with 

daily_state as (

    select
        fail_date as operation_date,
        'failed'  as state

    from Failed
    where fail_date between '2019-01-01' and '2019-12-31'
    union all 
    select 
        success_date,
        'succeeded'

    from Succeeded
    where success_date between '2019-01-01' and '2019-12-31'
    order by operation_date
),

daily_state_marks as (
    select 
        operation_date,
        state,
        subdate(operation_date, row_number() over (partition by state order by operation_date)) as mark
    from daily_state
)

select 
    state as period_state,
    min(operation_date) as start_date,
    max(operation_date) as end_date
from daily_state_marks
group by state, mark
order by start_date