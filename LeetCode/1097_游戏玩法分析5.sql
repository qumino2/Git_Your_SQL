-- 自连接，从最终结果倒推出倒数第二步应该呈现的是什么表
select
    A1.event_date as install_dt,
    count(*) as installs,
    round(count(A2.event_date) / count(*)*1.0 , 2) as Day1_retention

from Activity A1
left join Activity A2
    on A1.player_id = A2.player_id
    and A1.event_date = DATE_ADD(A2.event_date, INTERVAL -1 day)
where (A1.player_id, A1.event_date) in (select player_id, min(event_date) 
                                        from Activity 
                                        group by player_id)
group by A1.event_date
order by 1

--也可以用窗口函数在原表上先加一列标记处 first_day