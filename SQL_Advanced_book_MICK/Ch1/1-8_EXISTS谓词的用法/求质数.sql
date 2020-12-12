-- P148 例题1-8-3

--这道题解法的巧妙之处在于，引用同一张表两次，但一张表是做“被除数”用，而另一张表是做“除数”用

select num as prime
from Numbers Divided
where num > 1
and not exists 
        (select *
         from Numbers Divisor
         where Divisor.num <= Divided.num/2
         and Divisor.num > 1
         and MOD(Divided.num, Divisor.num) = 0)
order by prime;