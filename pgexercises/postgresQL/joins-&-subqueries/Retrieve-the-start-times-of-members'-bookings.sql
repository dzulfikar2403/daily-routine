select starttime
from cd.members m
left join cd.bookings b on (m.memid = b.memid)
where firstname ilike 'david' and surname ilike 'farrell';
-- link soal: https://pgexercises.com/questions/joins/simplejoin.html