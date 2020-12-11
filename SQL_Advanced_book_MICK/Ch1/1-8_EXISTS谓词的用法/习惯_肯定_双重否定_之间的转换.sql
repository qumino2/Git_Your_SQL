 -- P138 例题 请查询出”所有科目分数都在50分以上的学生“

select distinct
    student_id
  from TestScore TS1
 where not exists
        (
            select * 
              from TestScore TS2
             where TS2.student_id = TS1.student_id
               and TS2.score < 50
        );


-- P141 表达全称量化 （没看懂）
