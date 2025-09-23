select facid,
		name,
		membercost,
		monthlymaintenance
from cd.facilities
where membercost between 1 and (monthlymaintenance::decimal/50);
-- link soal: https://pgexercises.com/questions/basic/where2.html