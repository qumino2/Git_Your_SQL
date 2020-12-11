-- P137 例题 从 Meetings 表中求出”参加了某次会议的人“是很容易的，但是，如果反过来求”没有参加某次会议的人“呢？

SELECT DISTINCT M1.meeting, M2.person
FROM Meetings M1 CROSS JOIN Meetings M2
WHERE NOT EXISTS 
                 (SELECT *
                    FROM Meetings M3
                    WHERE M1.meeting = M3.meeting 
                    AND M2.person = M3.person);

-- 解法二：集合论的方法，使用差集运算

select Distinct 
   M1.meeting, M2.person
  from Meetings M1, Meetings M2 
except
select meeting, person
  from meetings;

-- 通过以上我们可以明白 NOT EXISTS 直接具备了差集运算的功能