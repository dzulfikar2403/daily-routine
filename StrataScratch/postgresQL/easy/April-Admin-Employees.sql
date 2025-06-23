select count(joining_date) n_admins
from worker
where department ilike 'admin' and extract(month from joining_date) >= 4;
-- link soal: https://platform.stratascratch.com/coding/9845-find-the-number-of-employees-working-in-the-admin-department?code_type=1