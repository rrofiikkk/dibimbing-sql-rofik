-- Soal: Ollivander's Innventory
-- Link: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true

-- Tugas:
--- Untuk setiap kombinasi power dan age (khusus tongkat yang tidak jahat), tampilkan tongkat termurah: id, age, coins_needed, power.
--- Diurutkan power DESC, age DESC

-- Pendekatam:
-- 1. CTE wand_data: join wands dengan wands_property, saring is_evil=0, kemudian htiung min(coins_needed) over (partition by age, power) sebagai coins_min (biaya termurah di tiap kelompok)
-- 2. Tampilkan hanya baris dengan coins_needed = coins_min, lalu urutkan sesuai ketentuan.


with wand_data as(
    select
        w.id,
        p.age,
        w.coins_needed,
        w.power,
        min(w.coins_needed) over (partition by p.age, w.power) as coins_min
    from wands as w
    join wands_property as p
    on w.code = p.code
    where p.is_evil = 0
)
select
    id,
    age,
    coins_needed,
    power
from wand_data
where coins_needed = coins_min
order by power desc, age desc;
