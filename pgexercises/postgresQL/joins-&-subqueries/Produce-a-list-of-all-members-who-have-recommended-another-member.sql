select distinct m2.firstname,
		m2.surname
from cd.members m1
inner join cd.members m2 on (m1.recommendedby = m2.memid)
order by 2,1;
-- link soal: https://pgexercises.com/questions/joins/self.html