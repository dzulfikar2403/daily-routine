-- Write your PostgreSQL query statement below
select user_id,
        concat(substr(upper(name),1,1),substr(lower(name),2)) name
from users
order by user_id;