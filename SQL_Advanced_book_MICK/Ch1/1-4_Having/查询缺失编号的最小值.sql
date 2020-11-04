-- P57 例题

-- 子查询和自连接确实思想上共通，都是要用到一张和原表一样的表进行对照，也就是“自己和自己比”

select 
    min(seq + 1) as gap
  from SeqTb1
 where (seq + 1) not in (select seq from SeqTb1);