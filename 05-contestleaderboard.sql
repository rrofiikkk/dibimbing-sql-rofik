-- Soal 5: Contest Leaderboard
-- Link: https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

-- Tugas
--- Total skor hacker = jumlah skor tertinggi di setiap challenge
--- Tampilkan hacker_id, name, total_skor. Buang yang total skornya 0.
--- Urutkan total skor DESC, hacker_id ASC

with max_per_challenge as(
    select
        hacker_id,
        challenge_id,
        max(score) as max_score
    from submissions
    group by hacker_id, challenge_id
),
with_name as(
    select
        m.hacker_id,
        h.name,
        m.max_score
    from max_per_challenge as m
    join hackers as h
    on m.hacker_id = h.hacker_id
)
select
    hacker_id,
    name,
    sum(max_score) as total_score
from with_name
group by hacker_id, name
having sum(max_score) > 0
order by total_score desc, hacker_id asc;
