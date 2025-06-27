
select name,
        sum(review_count) 
from yelp_business
group by name
order by sum desc
limit 5;
-- link soal: https://platform.stratascratch.com/coding/10048-top-businesses-with-most-reviews?code_type=1