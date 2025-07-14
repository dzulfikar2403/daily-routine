WITH cte as(
    select city,
        char_length(city) length_char,
        dense_rank() over(
            partition by char_length(city)
            order by city
        ) length_char_rank
    from station
)
select city,
        length_char
from cte
where length_char_rank = 1 and length_char in (select min(length_char) from cte)
union
select city,
        length_char
from cte 
where length_char_rank = 1 and length_char in (select max(length_char) from cte);
-- link soal: https://www.hackerrank.com/challenges/weather-observation-station-5/problem