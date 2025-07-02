-- untuk video yang dapat user flag terbanyak, hitung berapa flag yang direview oleh yt
with cte as (
    select  video_id,
            count(flag_id) as total_flag_id_by_vid
    from user_flags
    group by video_id
)
select uf.video_id,
        count(uf.flag_id) num_flags_reviewed_by_yt
from user_flags uf
left join flag_review fr on (uf.flag_id = fr.flag_id)
inner join cte on (uf.video_id = cte.video_id)
where fr.reviewed_by_yt = true and cte.total_flag_id_by_vid in (select max(total_flag_id_by_vid) from cte)
group by uf.video_id;
-- bisa lebih ringkas dengan dense_rank harusnya
-- link soal: https://platform.stratascratch.com/coding/2103-reviewed-flags-of-top-videos?code_type=1