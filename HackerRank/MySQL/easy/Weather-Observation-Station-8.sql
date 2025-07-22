select city
from station 
where left(city,1) in ('a','i','u','e','o') and right(city,1) in ('a','i','u','e','o');
-- link soal: https://www.hackerrank.com/challenges/weather-observation-station-8/problem