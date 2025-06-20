-- Write your PostgreSQL query statement below
select u.name,
        coalesce(sum(r.distance),0) as travelled_distance
from rides r
right join users u on (r.user_id = u.id)
group by u.id,u.name
order by travelled_distance desc, name;
