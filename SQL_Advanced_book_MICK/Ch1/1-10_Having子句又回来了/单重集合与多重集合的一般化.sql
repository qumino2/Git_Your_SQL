--练习题 P1-10-1

select 
    center
from Materials2
group by center
having count(distinct material || orgland) != count(material || orgland);