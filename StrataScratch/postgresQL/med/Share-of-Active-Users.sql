-- hitung percentage user yang dari US and status open
select round((count(user_id) filter (where country = 'USA' and status = 'open') * 100)::decimal / count(user_id) ,2) as us_active_share
from fb_active_users;
-- link soal: https://platform.stratascratch.com/coding/2005-share-of-active-users?code_type=1