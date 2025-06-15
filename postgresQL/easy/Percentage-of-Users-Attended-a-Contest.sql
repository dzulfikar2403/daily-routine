-- Write your PostgreSQL query statement below
select r.contest_id,
        round((count(r.user_id) * 1.0 / func.totalUsers) * 100,2) percentage
from register r, (select count(user_id) totalUsers from users ) func
group by r.contest_id,func.totalUsers
order by percentage desc, contest_id asc;