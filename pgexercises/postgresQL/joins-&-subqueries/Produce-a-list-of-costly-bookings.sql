select concat(m.firstname,' ',m.surname) as member,
		f.name as faility,
		case
			when m.memid = 0 then b.slots * f.guestcost
			when m.memid <> 0 then b.slots * f.membercost
		end as cost
from cd.members m
left join cd.bookings b on (m.memid = b.memid)
inner join cd.facilities f on (b.facid = f.facid)
where b.starttime::date = '2012-09-14' and (
  (m.memid = 0 and f.guestcost*b.slots > 30) or (m.memid <> 0 and f.membercost*b.slots > 30)
)
order by cost desc;
-- link soal: https://pgexercises.com/questions/joins/threejoin2.html