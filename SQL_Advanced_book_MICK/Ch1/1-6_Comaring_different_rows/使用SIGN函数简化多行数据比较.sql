-- P110 练习题1-6-1

-- 使用 SIGN 函数

select S1.year, S1.sale,
       case sign(sale - 
                    (select sale 
                       from Sales S2
                      where S2.year = S1.year - 1))
        when 0 then '-->'
        when 1 then '↑'
        when -1 then '↓'
        else '-' end as var
  from Sales S1
  order by year;