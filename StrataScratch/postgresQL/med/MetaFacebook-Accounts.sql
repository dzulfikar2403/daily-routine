select round(count(distinct acc_id) filter (where status = 'closed')::decimal / count(distinct acc_id),2) as closed_ratio
from fb_account_status
where status_date = '2020-01-10'::date;
-- the task has a bit ambigouos question
-- link soal: https://platform.stratascratch.com/coding/10296-facebook-accounts?code_type=1