select extract(year from inspection_date) inspection_year,
        count(inspection_id) n_violations
from sf_restaurant_health_violations
where business_name ilike 'Roxanne Cafe'
group by inspection_year;
-- link soal: https://platform.stratascratch.com/coding/9728-inspections-that-resulted-in-violations?code_type=1