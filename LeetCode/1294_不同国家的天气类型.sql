select
    country_name,
    case when avg(weather_state) <= 15 
            then 'Cold'
         when avg(weather_state) >= 25
            then 'Hot'
         else 'Warm'
    end as weather_type

from Weather
left join Countries
    on Weather.country_id = Countries.country_id
where date_format(day, '%Y-%m') = '2019-11'
group by Weather.country_id, date_format(day, '%Y-%m')