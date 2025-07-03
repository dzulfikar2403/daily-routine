select type,
        count(processed) filter (where processed = true)::decimal / count(processed) as processed_rate
from facebook_complaints
group by type;
-- link soal: https://platform.stratascratch.com/coding/9781-find-the-rate-of-processed-tickets-for-each-type?code_type=1