select client_id,
        extract(month from time_id) as month,
        count(distinct user_id)
from fact_events
group by client_id,month;
-- link soal: https://platform.stratascratch.com/coding/2024-unique-users-per-client-per-month?code_type=1