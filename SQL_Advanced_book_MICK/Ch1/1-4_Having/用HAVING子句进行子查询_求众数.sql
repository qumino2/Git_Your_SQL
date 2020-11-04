-- P59 例题

select
    income,
    count(*) as cnt
  from Graduates
 group by income
 having count(*) >= all (select count(*)
                           from Graduates
                          group by income);