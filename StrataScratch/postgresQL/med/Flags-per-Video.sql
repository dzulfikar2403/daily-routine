with cte as (
    select video_id,
            concat(user_firstname,' ',user_lastname) fullname,
            count(flag_id)
    from user_flags
    group by video_id,fullname
    having count(flag_id) <> 0
)
select video_id,
        count(fullname) num_unique_users
from cte
group by video_id;
-- link soal: https://platform.stratascratch.com/coding/2102-flags-per-video?code_type=1