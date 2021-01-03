-- 用窗口函数制造一个辅助的 reference 列
SELECT
    MIN(log_id) START_ID,
    MAX(log_id) END_ID
FROM
    (
    SELECT DISTINCT 
        log_id, 
        log_id - ROW_NUMBER() OVER ( ORDER BY log_id ASC ) reference
    FROM 
        Logs
    ) T
GROUP BY
    reference
ORDER BY
    START_ID

-- 巧妙取头取尾的解法，https://leetcode-cn.com/problems/find-the-start-and-end-number-of-continuous-ranges/solution/jian-yi-fang-fa-zhao-dao-lian-xu-zhi-de-tou-he-wei/

select a.log_id as START_ID ,min(b.log_id) as END_ID from 
(select log_id from logs where log_id-1 not in (select * from logs)) a,
(select log_id from logs where log_id+1 not in (select * from logs)) b
where b.log_id>=a.log_id
group by a.log_id

作者：ma-shi-fu-eric
链接：https://leetcode-cn.com/problems/find-the-start-and-end-number-of-continuous-ranges/solution/jian-yi-fang-fa-zhao-dao-lian-xu-zhi-de-tou-he-wei/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
