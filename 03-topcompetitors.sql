-- Soal 3: Top Competitors
-- Link: https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
-- Level: Medium

-- Tugas: 
--- Tampilkan hacker_id dan name dari hacker yang mendapat nilai penuh (full score) di lebih dari satu challenge.
--- Urutkan jumlah full score DESC, lalu hacker_id ASC

-- Pendekatan:
-- 1. CTE challenge_max: peta challenge_id -> max_score (join chalenges dengan difficulty)
-- 2. CTE full_score_count: hitung submission yang score = max_score per hacker_id, ambil hanya yang jumlahnya > 1 (HAVING)
-- 3. CTE hacker_name: join ke hackers untuk ambil name


with challenge_max as(
    select
        c.challenge_id,
        d.score as max_score
    from challenges as c
    join difficulty as d
    on c.difficulty_level = d.difficulty_level
),
full_score_count as(
    select
        s.hacker_id,
        count(distinct s.challenge_id) as count_max_score
    from submissions as s
    join challenge_max as cm
    on s.challenge_id=cm.challenge_id
    where s.score = cm.max_score
    group by s.hacker_id
    having count(distinct s.challenge_id)>1
),
leaderboard as(
    select
        f.hacker_id,
        h.name,
        f.count_max_score
    from full_score_count as f
    join hackers as h
    on f.hacker_id = h.hacker_id
)


select
    hacker_id,
    name
from leaderboard
order by
    count_max_score desc,
    hacker_id asc;
