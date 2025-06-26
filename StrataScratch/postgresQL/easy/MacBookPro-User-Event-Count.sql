select event_name,
        count(device) as event_count
from playbook_events
where device ilike 'macbook pro%'
group by event_name
order by event_count desc;
-- link soal: https://platform.stratascratch.com/coding/9653-count-the-number-of-user-events-performed-by-macbookpro-users?code_type=1