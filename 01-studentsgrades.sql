with student_grades as (
    select
        s.name,
        s.marks,
        g.grade
    from students as s
    join grades as g
        on s.marks between g.min_mark and g.max_mark
)
select
    case
        when grade < 8 then 'NULL'
        else name
    end as name,
    grade,
    marks
from student_grades
order by
    grade desc,
    case when grade >= 8 then name end asc,
    case when grade < 8 then marks end asc;
