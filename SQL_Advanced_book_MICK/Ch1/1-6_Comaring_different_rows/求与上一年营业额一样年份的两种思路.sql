-- P96 例题, 具体用哪种解法更好要看具体场景

-- 使用关联子查询
select 
    year, 
    sale
  from Sales S1
 where sale = (select sale)
                 from Sales S2
                where S2.year = S1.year - 1)
order by year;


-- 使用自连接

select 
    S1.sale, 
    S1.sale
  from Sales S1, Sales S2
 where S2.sale = S1.sale
   and S2.sale = S1.sale - 1
 order by year;

