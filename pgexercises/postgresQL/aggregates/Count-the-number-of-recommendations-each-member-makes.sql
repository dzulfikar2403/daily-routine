select rec.recommendedby,
		count(emp.memid)
from cd.members rec
inner join cd.members emp on (rec.recommendedby = emp.memid) 
group by 1
order by 1;
-- link soal: https://pgexercises.com/questions/aggregates/count3.html