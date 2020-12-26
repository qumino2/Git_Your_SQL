with 

my_data as (

	select * from {{ ref('my_data') }}

),

-- CTE comments go here
some_cte_agg as (

	select 
			id,
			sum(field_4) as total_field_4,
			max(field_5) as max_field_5

	from my_data
	group by 1

),

final as (

	select distinct 
			my_data.field_1,
			my_data.field_2,
			my_data.field_3,
			
			-- use line breaks to visually separate calculations into blocks
			case 
					when my_data.cancellation_date is null 
							and my_data.expiration_date is not null
							then expiration_date
					when my_data.cancellation_date is null
							then my_data.start_date + 7 
					else my_data.cancellation_date
			end as cancellation_date

			some_cte_agg.total_field_4,
			some_cte_agg.max_field_5

		from my_data
		left join some_cte_agg
				on my_data.id = some_cte_agg.id
		where my_data.field_1 = 'abc'
				and (
						my_data.field_2 = 'def' or 
						my_data.field_3 = 'ghi'
				)
		having count(*) > 1

)

select * from final

-- exists
select *
from Class_A A
where exists (
        select *
        from Class_B B
        where A.id = B.id
);

-- in
select *
from Class_A 
where id in (
            select id
            from Class_B
);

-- 嵌套函数
select round(
    coalesce(
    (select count(distinct requester_id ,accepter_id) from RequestAccepted) / 
    (select count(distinct sender_id ,send_to_id) from FriendRequest)
    ,0)
    ,2) as accept_rate ;