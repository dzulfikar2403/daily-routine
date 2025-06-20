-- Write your PostgreSQL query statement below
select *
from patients
where conditions ilike 'diab1%' or conditions ilike '% diab1%';