select facid,
		name,
		membercost,
		guestcost,
		initialoutlay,
		monthlymaintenance
from cd.facilities
where name ilike '%Tennis%';
-- link soal: https://pgexercises.com/questions/basic/where3.html