select department,
        count(worker_id) as num_workers
from worker
where joining_date >= '2014-4-1'::date
group by department
order by num_workers desc;
-- link soal: https://platform.stratascratch.com/coding/9847-find-the-number-of-workers-by-department?code_type=1