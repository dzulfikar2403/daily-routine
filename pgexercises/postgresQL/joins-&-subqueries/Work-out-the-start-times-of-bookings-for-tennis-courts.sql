select b.starttime,
		f.name
from cd.facilities f
left join cd.bookings b on (f.facid = b.facid)
where b.starttime::date = '2012-09-21' and f.name ilike 'tennis court%'
order by 1;
-- link soal: https://pgexercises.com/questions/joins/simplejoin2.html