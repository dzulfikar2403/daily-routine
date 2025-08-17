with country_comment as (
    select to_char(fcc.created_at,'yyyy-mm') as month,
            fau.country,
            sum(fcc.number_of_comments) as total_comment,
            dense_rank() over(
                partition by to_char(fcc.created_at,'yyyy-mm')
                order by sum(fcc.number_of_comments) desc
            )
    from fb_comments_count fcc
    inner join fb_active_users fau on (fcc.user_id = fau.user_id)
    where fcc.created_at between '2019-12-01' and '2020-01-31'
    group by month,fau.country
)
select cc1.country
from country_comment cc1
inner join country_comment cc2 on (cc1.country = cc2.country and cc1.month < cc2.month)
where cc1.total_comment < cc2.total_comment and cc2.dense_rank = 1;
/*
 "Actually I met this question in the interview with meta last year. 
    I remember the question should be Which country had the highest increase in the number of comments
    from December 2019 to January 2020?" ~ AlFrecso739

  "correct description as per the expected output should be:-
    find the country with most number of comments done between 2019-12-31 and 2020-01-31." ~ dev
*/
-- link soal: https://platform.stratascratch.com/coding/2007-rank-variance-per-country?code_type=1