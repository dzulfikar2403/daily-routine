SELECT count(CASE
            WHEN device_type in ('tablet','phone') then device_type
          END) mobile_views,
        count(CASE
          WHEN device_type = 'laptop' then device_type
        END) laptop_views
FROM viewership;
-- mending make pendekatan filter (where expression_condition).
-- link soal: https://datalemur.com/questions/laptop-mobile-viewership