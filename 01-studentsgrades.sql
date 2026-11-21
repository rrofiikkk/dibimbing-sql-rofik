-- Soal 1: The Report
-- Link : https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

-- Tugas:
-- Buat laporan berisi Name, Grade, Marks.
--- Siswa dengan grade < 8, namanya ditampilkan sebagai 'NULL'.
--- Urutkan dari grade tertinggi ke terendah
--- Grade 8-10 dengan grade sama: urutkan nama A-Z
--- Grade 1-7 dengan grade sama: urutkan marks dari kecil ke besar

-- Pendekatan:
-- 1. CTE student_grades: menggabungkan students dan grades pakai between supaya tiap siswa dapat grade sesuai rentang nilainya.
-- 2. CASE di SELECT untuk mengganti nama jadi 'NULL' kalau grade < 8.
-- 3. ORDER BY grade DESC, 2 CASE untuk aturan urutan yang beda, antara grade >=  8 (nama) dan grade < 8 (marks)



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
