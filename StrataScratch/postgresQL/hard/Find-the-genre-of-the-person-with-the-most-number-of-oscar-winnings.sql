select ni.top_genre
from oscar_nominees onn
left join nominee_information ni on (onn.nominee = ni.name)
where ni.top_genre is not null
group by ni.name,ni.top_genre
order by count(*) filter (where onn.winner = true) desc,ni.name
limit 1;
-- link soal: https://platform.stratascratch.com/coding/10171-find-the-genre-of-the-person-with-the-most-number-of-oscar-winnings?code_type=1