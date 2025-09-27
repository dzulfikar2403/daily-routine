select name,
		case
			when monthlymaintenance > 100 then 'expensive'
			else 'cheap'
		end as cost
from cd.facilities;
-- link soal: https://pgexercises.com/questions/basic/classify.html