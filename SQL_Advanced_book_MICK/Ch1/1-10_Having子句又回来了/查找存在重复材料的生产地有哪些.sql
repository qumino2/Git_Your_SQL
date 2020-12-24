select 
    center,
    material
from 
    Materials M1
where exists (
    select * 
    from Materials M2
    where M1.center = M2.center
    and M1.material = M2.material
    and M1.receive_date <> M2.receive_date
);