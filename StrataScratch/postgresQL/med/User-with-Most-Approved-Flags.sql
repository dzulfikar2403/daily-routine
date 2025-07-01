with cte as (
    select concat(uf.user_firstname,' ',uf.user_lastname) username,
        count(distinct uf.video_id) count_video
    from user_flags uf
    left join flag_review fr on (uf.flag_id = fr.flag_id)
    where fr.reviewed_outcome ilike 'approved'
    group by username
)
select username
from cte, (select max(count_video) from cte)func
where cte.count_video = func.max;
-- link soal: https://platform.stratascratch.com/coding/2104-user-with-most-approved-flags?code_type=1