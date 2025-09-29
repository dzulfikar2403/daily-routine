select surname 
from cd.members
union
select name
from cd.facilities;
-- link soal: https://pgexercises.com/questions/basic/union.html