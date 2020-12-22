with answerRateList as (
    select  question_id,
            sum(case when action = 'answer' then 1 else 0 end) 
            / count(question_id) * 1.0 as answerRate
    from survey_log
    group by question_id
)

select distinct question_id as survey_log
from answerRateList
where answerRate = (select max(answerRate) from answerRateList)