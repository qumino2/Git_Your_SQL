-- P83 商品主表，商品销售历史表，生成以商品为单位的销量

-- 解法1 非最优解 - 先聚合后再连接

SELECT I.item_no, SH.total_qty
FROM Items I LEFT OUTER JOIN (SELECT item_no, SUM(quantity) AS total_qty
    FROM SalesHistory
    GROUP BY item_no) SH ON I.item_no = SH.item_no;


-- 解法2 最优解 - 由于是一对多的关系，连接后行数不会异常增加，所以可以先连接再聚合，这样的代码更简洁，而且没有使用临时视图

SELECT I.item_no, SUM(SH.quantity) AS total_qty
FROM Items I LEFT OUTER JOIN SalesHistory SH ON I.item_no = SH.item_no
GROUP BY I.item_no;