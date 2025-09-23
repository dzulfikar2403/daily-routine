select facid,
		name,
		membercost,
		guestcost,
		initialoutlay,
		monthlymaintenance
from cd.facilities
where facid in (1,5);
-- link soal: https://pgexercises.com/questions/basic/where4.html