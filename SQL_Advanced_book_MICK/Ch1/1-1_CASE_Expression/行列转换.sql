-- P20, 练习题1-1-2 

select
    case when sex = 1
         then '男'
         when sex = 2
         then '女'
    end as "性别",

    sum(population) as "全国",
    sum(case when pref_name = '德岛' 
             then population
             else 0 end) as "德岛"
    sum(case when pref_name = '香川' 
             then population
             else 0 end) as "香川"
    sum(case when pref_name = '爱媛' 
             then population
             else 0 end) as "爱媛"
    sum(case when pref_name = '高知' 
             then population
             else 0 end) as "高知"
    sum(case when pref_name in ('德岛', '香川', '爱媛', '高知')
             then population
             else 0 end) as "四国（再揭）"

from PopTbl2
group by 1

-- 延伸：如果”合计“和”再揭“展示在表侧栏（行中）而不是表头（列中），应该怎么做？对于 SQL 来说，处理复杂的表头不算太困难，但是处理复杂的表侧栏则非常困难