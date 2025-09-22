select  m1.firstname as memfname,
		m1.surname as memsname,
		m2.firstname as recfname,
		m2.surname as recsname
from cd.members m1
left join cd.members m2 on (m1.recommendedby = m2.memid)
order by 2,1;
-- link soal: https://pgexercises.com/questions/joins/self2.html