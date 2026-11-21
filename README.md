# dibimbing-sql-rofik
Kumpulan jawaban soal SQL dari HackerRank untuk tugas Dibimbing.

| No | Soal | Level | Konsep | File | SS |
|----|------|-------|--------|------|-------|
| 1 | [The Report](https://www.hackerrank.com/challenges/the-report/problem) | Medium | JOIN dengan BETWEEN, CASE, ORDER BY bersyarat | [01-studentsgrades.sql](01-studentsgrades.sql) | <img width="300" alt="The Report" src="https://github.com/user-attachments/assets/2efdffd8-2d96-4807-b959-3e04ae521dfc" /> |
| 2 | [Weather Observation Station 18](https://www.hackerrank.com/challenges/weather-observation-station-18/problem) | Medium | MIN/MAX, ABS, CAST DECIMAL | [02-weather-observation-station-18.sql](02-weather-observation-station-18.sql) | <img width="936" height="425" alt="image" src="https://github.com/user-attachments/assets/4b38bcb7-4101-45aa-aab7-e0b2771ea99b" /> |
| 3 | [Top Competitors](https://www.hackerrank.com/challenges/full-score/problem) | Medium | Multi-JOIN, GROUP BY, HAVING | [03-top-competitors.sql](03-top-competitors.sql) | <img width="937" height="422" alt="image" src="https://github.com/user-attachments/assets/43d43862-34f1-4513-83d6-04cf26a64846" /> |
| 4 | [Ollivander's Inventory](https://www.hackerrank.com/challenges/harry-potter-and-wands/problem) | Medium | Window function MIN() OVER (PARTITION BY) | [04-ollivanders-inventory.sql](04-ollivanders-inventory.sql) |<img width="941" height="391" alt="image" src="https://github.com/user-attachments/assets/f0ba3ae5-aaa5-4560-8c6b-7b307554102d" /> |
| 5 | [Contest Leaderboard](https://www.hackerrank.com/challenges/contest-leaderboard/problem) | Medium | Agregasi bertingkat, HAVING | [05-contest-leaderboard.sql](05-contest-leaderboard.sql) |<img width="937" height="422" alt="image" src="https://github.com/user-attachments/assets/1ab974f4-796d-434f-9e3e-054b94b4eccf" /> |

Reflection Questions
1. Ketika membangun solusi untuk setiap studi kasus, bagaimana Anda menentukan struktur query yang paling efektif (misalnya memutuskan kapan menggunakan CTE, kapan cukup dengan subquery, atau kapan window function lebih tepat dibanding agregasi biasa)? Jelaskan bagaimana pertimbangan tersebut membantu Anda menghasilkan query yang lebih terstruktur, mudah diuji, dan efisien.

=> Biasanya saya mulai dengan melihat berapa tahap pengolahan yang dibutuhkan data. Kalau prosesnya bertingkat, misalnya cari MAX per challenge dulu lalu dijumlahkan per hacker, saya pakai CTE supaya tiap tahap jelas dan bisa dicek satu persatu. Kalau logikanya cuma satu langkah kecil, subquery atau satu select biasa sudah cukup. 
Kalau window function dan agregasi biasa, kuncinya ada di detail baris. Kalau detail per baris masih dibutuhkan, seperti id tongkat di soal Ollivander, saya pakai window function. Kalau outputnya cukup berupa ringkasan per kelompok, group by + having sudah oke.

2. Setelah mengerjakan seluruh soal, teknik SQL lanjutan apa yang menurut Anda paling memberi dampak pada cara Anda menganalisis dan memproses data (misalnya range join, window function, nested aggregation, atau CASE WHEN)? Jelaskan bagaimana teknik tersebut dapat membantu Anda menyelesaikan masalah data yang lebih kompleks di pekerjaan nyata.

=> Buat saya adalah window function. Sebelumnya kalau butuh nilai per kelompok tapi tetep ingin detail per baris, saya biasanya pakai group by lalu join balik ke tabel asal. Hasilnya panjang dan rawan salah. Dengan window function seperti min() over (partition by…) di soal Ollivander, keduanya bisa didapat sekaligus dalam satu langkah. 

