select distinct concat(m.firstname,' ',m.surname) as member,
		f.name as facility
from cd.members m
left join cd.bookings b on (m.memid = b.memid)
inner join cd.facilities f on (b.facid = f.facid)
where f.name ilike '%tennis court%'
order by 1,2;
-- link soal: https://pgexercises.com/questions/joins/threejoin.html