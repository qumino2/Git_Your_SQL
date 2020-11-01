-- P14, 表之间的数据匹配，例题
-- 注意这里不需要 join 之后用带 case 的聚合函数，而是直接用 case 判断一张表和另一张表之间的数据是否匹配，不涉及表的 join

--表的匹配：使用 IN 谓词
select course_name,
        case when course_id in 
                    (select course_id from OpenCourses
                      where month = 200706) then 'O'
            else 'X' end as '6 月',
        case when course_id in 
                    (select course_id from OpenCourses
                      where month = 200707) then 'O'
            else 'X' end as '7 月',
        case when course_id in 
                    (select course_id from OpenCourses
                      where month = 200708) then 'O'
            else 'X' end as '8 月'
from CourseMaster;

--表的匹配：使用 EXISTS 谓词
select CM.course_name,
       case when exists
                    (select course_id from OpenCourses OC
                      where month = 200706
                        and OC.course_id = CM.course_id) then 'O'
            else 'X' end as '6 月' ，
        case when exists
                    (select course_id from OpenCourses OC
                      where month = 200707
                        and OC.course_id = CM.course_id) then 'O'
            else 'X' end as '7 月' ，
        case when exists
                    (select course_id from OpenCourses OC
                      where month = 200708
                        and OC.course_id = CM.course_id) then 'O'
            else 'X' end as '8 月' 
from CourseMaster;
            
