-- Write your PostgreSQL query statement below
with cte as (
    select requester_id as id
    from RequestAccepted 
    union all 
    select accepter_id as id
    from RequestAccepted 
),
listFriendNumber as (
    select id,
        count(id) as num
    from cte 
    group by id
)
select *
from listFriendNumber
where num = (select max(num) from listFriendNumber);
-- link soal: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/