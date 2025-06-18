-- Write your PostgreSQL query statement below
select lb.book_id,
        lb.title,
        lb.author,
        lb.genre,
        lb.publication_year,
        count(br.book_id) current_borrowers
from library_books lb
left join borrowing_records br on (lb.book_id = br.book_id)
where br.return_date is null
group by lb.book_id,lb.title,lb.author,lb.genre,lb.publication_year,lb.total_copies
having count(br.book_id) = lb.total_copies
order by current_borrowers desc,title asc;