/*
Enter your query here.
*/
with cte1 as (
    select concat(name , '(' , substr(occupation,1,1) , ')') as fullname
    from occupations
),
cte2 as (
    select concat('There are a total of ', count(name) ,' ', lower(Occupation) , 's.') as text
    from occupations
    group by occupation
)
select * from cte1
union
select * from cte2
order by 1;
-- link soal: https://www.hackerrank.com/challenges/the-pads/problem