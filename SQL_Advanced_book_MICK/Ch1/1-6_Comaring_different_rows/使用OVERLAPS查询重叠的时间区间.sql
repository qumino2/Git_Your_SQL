-- P101 练习题1-6-2

--注意 OVERLAP 和 between 之间的区别，在一个时间点重复的话 OVERLAP 是不算重叠的。如同一天上一房客退房，下一房客入住

SELECT reserver, start_date, end_date

FROM Reservations R1
WHERE EXISTS (SELECT *
FROM Reservations R2
WHERE R1.reserver <> R2.reserver -- 与除自己以外的客人进行比较 
AND (R1.start_date, R1.end_date) OVERLAPS (R2.start_date, R2.end_date));

