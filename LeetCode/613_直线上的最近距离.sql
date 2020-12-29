select
    min(abs(P1.x - P2.x)) as shortest
from point P1, point P2
where P1.x > P2.x; -- 这里用非等值自连接，用 > 比用 != 要好，前者是组合数，后者是排列数