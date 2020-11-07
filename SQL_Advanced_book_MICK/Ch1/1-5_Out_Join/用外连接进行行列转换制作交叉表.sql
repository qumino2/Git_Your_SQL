-- P73 例题

-- 使用外连接的方式，但是随着表头的增加，外连接的数量也会增加
select
    case when C1.name is not null then 'O' else null end as "SQL 入门",
    case when C2.name is not null then 'O' else null end as "UNIX 基础",
    case when C3.name is not null then 'O' else null end as "Java 中级"
  from (select distinct name from Courses) C0
  left outer join
    (select name from Courses where course = 'SQL入门') C1
    on C0.name = C1.name
        left outer join
            (select name from Courses where course = 'UNIX 基础') C2
            on C0.name = C2.name
                left outer join
                    (select name from Courses where course = 'Java 中级') C3
                    on C0.name = C3.name

-- 使用标量子查询的方式
select C0.name,
       (select 'O'
          from Courses C1
          where course = 'SQL入门'
            and C1.name = C0.name) as "SQL 入门",
        (select 'O'
          from Courses C2
          where course = 'UNIX基础'
            and C2.name = C0.name) as "UNIX 基础",
        (select 'O'
          from Courses C3
          where course = 'Java中级'
            and C3.name = C0.name) as 'Java 中级'
  from (select distinct name from Courses) C0;


-- 嵌套使用 CASE 表达式，注意在 select 子句中聚合函数的执行结果也是标量值，所以和常量和普通列一样可以用于条件判断
select 
    name,
    case when sum(case when course = 'SQL入门' then 1 else null end) = 1
         then 'O' else null end as 'SQL入门',
    case when sum(case when course = 'UNIX基础' then 1 else null end) = 1
         then 'O' else null end as 'UNIX基础',
    case when sum(case when course = 'Java中级' then 1 else null end) = 1
         then 'O' else null end as 'Java中级'
  from Courses
 group by name;

  
