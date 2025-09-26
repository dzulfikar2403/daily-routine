select distinct concat(firstname,' ',surname) as member,
		(select concat(firstname,' ',surname)
			from cd.members rec
			where m.recommendedby = rec.memid) as recommender
from cd.members m
order by 1;
-- link soal: https://pgexercises.com/questions/joins/sub.html