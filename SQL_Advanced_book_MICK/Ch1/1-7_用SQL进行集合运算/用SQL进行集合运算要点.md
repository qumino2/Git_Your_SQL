# 要点

1. 关系除法是什么意思？
<https://cloud.tencent.com/developer/article/1176184>
2. 不加可选项 ALL, 则集合运算符为了排除掉重复行，默认会发生排序；因此如果不关心结果是否有重复行或者确定没有重复行，那么尽量 ALL 可选项优化性能。
3. 集合运算符有优先级，INTERSECT 比  UNION 和 EXCEPT 的优先级更高。可以用括号来明确顺序。
4. 四则运算的和（UNION）、差（EXCEPT）、积（CROSS JOIN）、商（DIVIDE BY，还没有被标准化)
