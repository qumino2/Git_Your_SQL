select 
    sum(I1.TIV_2016) as TIV_2016
from insurance I1
where exists(
            select *
            from insurance I2
            where I1.PID != I2.PID
            and I1.TIV_2015 = I2.TIV_2015
)
and not exists(
            select *
            from insurance I3
            where I1.PID != I3.PID
            and I1.LAT = I3.LAT
            and I1.LON = I3.LON
);