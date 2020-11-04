-- P57 例题

-- 如果有查询结果，说明存在缺失的编号

select
    "存在缺失的编号" as gap
  from SeqTb1
having count(*) <> max(seq);

-- P71 练习题1-4-1

select
  case when count(*) <> max(seq) 
       then "存在缺失编号"
       else "不存在缺失编号"
  end as gap
from SeqTb1;
       
  