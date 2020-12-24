# 要点

1. 避免排序

- group by 
- order by 
- 聚合函数
- Distinct
- 集合运算符 (union, intersect, except)
- 窗口函数 (rank, row_number)

2. 集合运算符尽量加上 all 

3. 使用 exists 或 join 代替 in

4. 使用 exists 代替 distinct

5. 在极值函数中使用索引 （MAX/MIN)

- 这样写需要扫描全表 SELECT MAX(item) FROM Items;
- 这样写能用到索引 SELECT MAX(item_no) FROM Items;

6. 在 group by 子句和 order by 子句中使用索引
7. 条件表达式的左侧应该是原始字段

- WHERE col_1 > 100 / 1.1 用到索引
- WHERE col_1 * 1.1 > 100 没有用到索引

8. 需要对多个字段使用 in 谓词时，将它们汇总到一处

9. 连接表双方的关系如果是一对一或者一对多时，连接运算即乘法运算行数不会增加；如果是多对多关系的话可以分解成两个一对多的关系