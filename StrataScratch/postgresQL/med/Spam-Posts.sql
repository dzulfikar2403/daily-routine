select fp.post_date,
        count(fpv.post_id) filter (where fp.post_keywords ilike '%spam%') * 100 / count(fpv.post_id) as spam_share_percentage
from facebook_posts fp
left join facebook_post_views fpv on (fp.post_id = fpv.post_id)
group by fp.post_date;
-- link soal: https://platform.stratascratch.com/coding/10134-spam-posts?code_type=1