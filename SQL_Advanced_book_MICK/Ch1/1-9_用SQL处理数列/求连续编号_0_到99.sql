-- P151 例题, 通过追加 D3 D4等集合，不论多少位数都可以生成

-- 这种生成连续编号的方法，完全忽略了数 的“顺序”这一属性。将这个解法和本书多次介绍过的冯·诺依曼型有 序数的定义进行比较，可以很容易发现它们的区别A 。冯·诺依曼的方 法使用递归集合定义自然数，先定义 0 然后得到 1，定义 1 然后得到 2， 是有先后顺序的（因此这种方法适用于解决位次、累计值等与顺序相关 的问题）。

-- 而这里的解法完全丢掉了顺序这一概念，仅把数看成是数字的组合。 这种解法更能体现出 SQL 语言的特色。

select D1.digit + (D2.digit * 10) as seq
from Digits D1 cross join Digits D2
order by seq;

-- 通过将这个查询的结果存储在视图里，就可以在需要连续编号时通过 简单的 SELECT 来获取需要的编号。

CREATE VIEW Sequence (seq)
As select D1.digit + (D2.digit * 10) + (D3.digit * 100)
    from Digits D1 cross join Digits D2 
            cross join Digits D3;

-- 从序列视图中获取 1-100

select seq
from Sequence
where seq between 1 and 100
order by seq;