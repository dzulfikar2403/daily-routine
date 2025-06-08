-- Write your PostgreSQL query statement below
select w.name,
        w.population,
        w.area
from world w
where area >= 3000000 or population >= 25000000;