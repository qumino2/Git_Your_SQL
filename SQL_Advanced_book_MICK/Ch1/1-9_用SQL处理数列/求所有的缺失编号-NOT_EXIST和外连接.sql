-- P166 练习题 1-9-1

/* 进行差集运算的四种方法 
1. 首选 EXCEPT
2. NOT IN
3. 和 NOT IN 类似的 NOT EXISTS
4. 麻烦的方法：外连接
*/



--NOT EXISTS版本
select seq
from Sequence N
where seq between 1 and 12
and not exists (select * 
                from SeqTb1 SeqTb1
                where N.seq = S.seq)

--外连接版本
select N.seq
from Sequence N left outer join SeqTb1 S
on N.seq = S.seq
where N.seq between 1 and 12
and S.seq is null;