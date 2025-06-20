-- Write your PostgreSQL query statement below
select u.name,
        sum(t.amount) balance
from transactions t
inner join users u on (t.account = u.account)
group by u.name
having sum(t.amount) > 10000 