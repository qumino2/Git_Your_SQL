对列进行量化_查询全是1的行
-- P143 例题

select * 
  from ArrayTb1
 where 1 = ALL (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10);

 -- P145 例题 查询全是 null 的行

 select * 
  from ArrayTb1
 where coalesce(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10) is null;

 