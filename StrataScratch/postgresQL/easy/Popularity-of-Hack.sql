select fe.location,
        avg(fhs.popularity) as avg_popularity
from facebook_employees fe
left join facebook_hack_survey fhs on (fe.id = fhs.employee_id)
group by fe.location;
-- link soal: https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=1