with all_user_pairs as(
    select user1,user2
    from facebook_friends
    union
    select user2,user1
    from facebook_friends
)
select user1,
        round(count(user2)::decimal / (select count(distinct user1) from all_user_pairs) *100 ,2)
from all_user_pairs
group by user1
order by user1;
-- link soal: https://platform.stratascratch.com/coding/10284-popularity-percentage?code_type=1