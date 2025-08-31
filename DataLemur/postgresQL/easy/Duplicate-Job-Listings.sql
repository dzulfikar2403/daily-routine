with cte as (
  SELECT  company_id,
          title,
          description,
          count(job_id)
  FROM job_listings
  group by 1,2,3
  having count(job_id) > 1
)
select count(*)
from cte;
-- link soal: https://datalemur.com/questions/duplicate-job-listings