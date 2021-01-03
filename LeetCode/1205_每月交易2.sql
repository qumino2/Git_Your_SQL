-- 当看起来要分别 group by 两个不同的 date 列时，想想能不能把这两个 date 列 union 起来
with

transactions_and_chargebacks as (
    select *,
    'T' as tag

    from Transactions
    union all
    select 
        trans_id,
        country,
        state,
        amount,
        chargebacks.trans_date,
        'C' as tag

    from chargebacks left join Transactions
        on chargebacks.trans_id = Transactions.id
)

select
    date_format(trans_date, '%Y-%m') as month,
    country,
    coalesce(sum(tag = 'T' and state = 'approved'),0) as approved_count,
    coalesce(sum(case when tag = 'T' and state = 'approved' then amount else 0 end),0) as approved_amount,
    coalesce(sum(tag = 'C'),0) as chargeback_count,
    coalesce(sum(case when tag = 'C' then amount else 0 end),0) as chargeback_amount

from transactions_and_chargebacks
group by date_format(trans_date, '%Y-%m'), country
having approved_count > 0 or chargeback_count > 0;


-- mysql 没有 full join 怪不得跑不通
with 

approved_agg as (
    select
        date_format(trans_date, '%Y-%m') as month,
        country,
        sum(state = 'approved') as approved_count,
        sum(case when state = 'approved' then amount else 0 end) as approved_amount

    from Transactions
    group by date_format(trans_date, '%Y-%m'), country
),

chargeback_agg as (
    select
        date_format(Chargebacks.trans_date, '%Y-%m') as month,
        country,
        count(trans_id) as chargeback_count,
        sum(case when Chargebacks.trans_date is not null then amount else 0 end) as chargeback_amount

    from Transactions
    left join Chargebacks
        on Transactions.id = Chargebacks.trans_id
    group by date_format(Chargebacks.trans_date, '%Y-%m'), country

)

select 
    chargeback_agg.month,
    approved_agg.country,
    coalesce(approved_count, 0) as approved_count,
    coalesce(approved_amount, 0) as approved_amount,
    coalesce(chargeback_count, 0) as chargeback_count,
    coalesce(chargeback_amount, 0) as chargeback_amount

from approved_agg
full join chargeback_agg
    on approved_agg.month = chargeback_agg.month
    and approved_agg.country = approved_agg.country