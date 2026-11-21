-- Saol 2: Weather Observation Station 18
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
-- Level: Medium
-- Tabel: Station (ID, City, State, Lat_N, Long_W)

-- Tugas: 
--- Tabel station berisi lokasi banyak stasiun cuaca
--- (lat_n = garis lintang, long_w = garis bujur)

--- Dari semua stasiun itu, buat dua titik:
--- Titik 1 = lintang terkecil dan bujur terkecil
--- Titik 2 = lintang terbesar dan bujur terbesar

--- Hitung jarak Manhattan antara kedua titik, yaitu jarak kalau kita hanya boleh jalan lurus (seperti menyusuri blok jalan di kota), tidak boleh memotong miring.
--- Jarak: (selisih lintang) + (selisih bujur)

--- Contoh: Titik 1 = (2,3), Titik 2= (5,7)
--- selisih lintang = 5 - 2 = 3
--- selisih bujur = 7-3 = 4
--- jarak Manhattan = 3+4 =7 

-- Tampilkan hasilnya dengan 4 angka di belakang koma (misal 7.0000)

with agg as (
    select
        min(lat_n) as a,
        min(long_w) as b,
        max(lat_n) as c,
        max(long_w) as d
    from station
)


select
    cast(abs(c-a)+abs(d-b) as decimal(10,4)) from agg;
