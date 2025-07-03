-- cari review-text yang menerima cool votes tertinggi
-- output business name bersama dengan review textnya
with sum_cool_votes as (
    select business_name,
            review_text,
            sum(cool) as sum_cool,
            dense_rank() over(
                order by sum(cool) desc
            )
    from yelp_reviews
    group by business_name,review_text
)
select business_name,
       review_text
from sum_cool_votes scv
where dense_rank = 1;
-- tf. cuman disuruh nampilin review_text yang coolnya paling tinggi, bukan di group ... !!!
-- link soal: https://platform.stratascratch.com/coding/10060-top-cool-votes?code_type=1