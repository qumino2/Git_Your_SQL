1. NULL 不是值也不是变量，所以不能对其使用谓词，否则得到的结果总是 unknown. "列的值为 NULL“ "NULL 值"这样的说法是错误的。
2. IS NULL 整个是一个谓词，所以写作 IS_NULL 更合适
3. 三个真值之间的优先级顺序：
- AND 的情况：false > unknown > true
- OR 的情况：true > unknown > false
所以 AND 的运算结果如果为 true 则参与运算的双方都为 true，如果 OR 的运算结果为 false 则参与运算的双方都为 false
4. SQL 语句的查询结果里只有判断结果为 true 的行
5. 极值函数 min(), max() 在统计时会把为 NULL 的数据排除掉; 
6. 极值函数(除了count 以外的聚合函数都是如此)在输入空集时会返回 NULL, 因此需要使用 COALESCE()
