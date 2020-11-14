-- P114 例题

--基础解法：先确定相比较的两张表的行数一致，再利用 UNION 特性使用下面的查询，如果结果行数与两表一致，则两张表是相等的。
-- 也可以利用 UNION 运算的幂等性（只适用于数学意义上的集合）来比较三张以上的表是否相等
select count(*) as row_count
from (                select *
        from tbl_A
    union
        select *
        from tbl_B) TMP;



-- 进阶解法：(A ∪ B ) = (A ∩ B) ⇔ (A = B)

SELECT CASE WHEN COUNT(*) = 0 THEN '相等' ELSE '不相等' END AS result
FROM (        (
                SELECT *
        FROM tbl_A
    UNION
        SELECT *
        FROM tbl_B
    )
    EXCEPT
    (
            SELECT *
        FROM tbl_A
    INTERSECT
        SELECT *
        FROM tbl_B)) TMP;



-- 比较表与表的 diff, 求出两个集合的异或集

    (
    SELECT *
    FROM tbl_A
EXCEPT
    SELECT *
    FROM tbl_B)
UNION ALL
    (
    SELECT *
    FROM tbl_B
EXCEPT
    SELECT *
    FROM tbl_A);