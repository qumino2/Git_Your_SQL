with

Customer_totals as (
    select
        visited_on,
        sum(amount) as amount
    from Customer
    group by visited_on
    order by visited_on
)

select 
    C1.visited_on,
    sum(C2.amount) as amount,
    round(sum(C2.amount) / 7, 2) as average_amount

from Customer_totals C1, Customer_totals C2
where datediff(C1.visited_on, C2.visited_on) between 0 and 6
group by C1.visited_on
having count(C2.visited_on) = 7