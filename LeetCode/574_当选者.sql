-- 用 having 解决同票问题的解法

select 
    name
from Candidate c
inner join Vote v
on c.id = v.CandidateId
group by v.CandidateId
having count(*) >= all(select count(*) 
                                   from Vote
                                   group by CandidateId);





-- 官方解法, 先解决主要问题再用 join 查找信息。但是使用 order by 和 limit 无法解决同票的问题

select Name
from Candidate
join (
    select 
    CandidateID as id

    from Vote
    group by CandidateId
    order by count(CandidateId) desc
    limit 1
) as Winner on Candidate.id = Winner.id








--自己一开始的解法，不优雅，使用 join 比较好
select Name 
from Candidate
where id = (
    select CandidateId from (
        select CandidateId, count(CandidateId) as voteCount
        from Vote
        group by CandidateId
        order by 2 desc
        limit 1
    ) tmp
)