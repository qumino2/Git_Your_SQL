-- P92 练习题 1-5-1

-- 原代码是先聚合再连接，这样就会有临时视图 DATA
SELECT MASTER.age_class AS age_class, MASTER.sex_cd AS sex_cd, DATA.pop_tohoku AS pop_tohoku, DATA.pop_kanto AS pop_kanto
FROM (SELECT age_class, sex_cd
    FROM TblAge CROSS JOIN TblSex ) MASTER LEFT OUTER JOIN (SELECT age_class, sex_cd, SUM(CASE WHEN pref_name IN ('青森', '秋田') THEN population ELSE NULL END) AS pop_tohoku, SUM(CASE WHEN pref_name IN ('东京', '千叶') THEN population ELSE NULL END) AS pop_kanto
    FROM TblPop
    GROUP BY age_class, sex_cd) DATA ON MASTER.age_class = DATA.age_class AND MASTER.sex_cd = DATA.sex_cd;

--修改后的代码
SELECT MASTER.age_class AS age_class, MASTER.sex_cd AS sex_cd, SUM(CASE WHEN pref_name IN ('青森', '秋田') THEN population ELSE NULL END) AS pop_tohoku, SUM(CASE WHEN pref_name IN ('东京', '千叶') THEN population ELSE NULL END) AS pop_kanto
FROM (SELECT age_class, sex_cd
    FROM TblAge CROSS JOIN TblSex) MASTER LEFT OUTER JOIN TblPop 
 ON MASTER.age_class = DATA.age_class AND MASTER.sex_cd = DATA.sex_cd GROUP BY MASTER.age_class, MASTER.sex_cd;