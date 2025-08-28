SELECT p.page_id
FROM pages p
left join page_likes pl on (p.page_id = pl.page_id) 
where COALESCE(pl.page_id,0) = 0
order by p.page_id;
-- bisa langsung make is null, gausah make coalesce.

-- or gunain except
SELECT page_id FROM pages
EXCEPT
SELECT page_id FROM page_likes
order by page_id asc;
-- link soal: https://datalemur.com/questions/sql-page-with-no-likes