-- 思路：新增两列，一列是正序累计，一列是逆序累计

select avg(Number) as median
from (
    select 
        Number,
        Frequency,
        sum(Frequency) over (order by Number) as AccumFrequency_asc,
        sum(Frequency) over (order by Number desc) as AccumFrequency_desc
    from 
        Numbers
) AccumFreq
where AccumFrequency_asc >= (select sum(Frequency) from Numbers) / 2
and AccumFrequency_desc >= (select sum(Frequency) from Numbers) / 2

