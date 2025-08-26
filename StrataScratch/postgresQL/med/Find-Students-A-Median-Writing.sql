with cte as(
    select *,row_number() over(
                order by sat_writing
            ) 
    from sat_scores
),
place_median_row_number as(
    select case
            when count(student_id) % 2 = 1 then ceil(count(student_id) / 2) -- odd val
            else count(student_id) / 2 -- even val1
           end as rn1,
           case
            when count(student_id) % 2 = 0 then (count(student_id) / 2) + 1 -- even val2
            else null
           end as rn2
    from cte
),
value_of_median as(
    select sat_writing
    from cte
    where row_number in (
      select rn1 from place_median_row_number
      union
      select rn2 from place_median_row_number where rn2 is not null
    )
)
select student_id
from sat_scores
where sat_writing in (
    select case
              when count(*) = 2 then avg(sat_writing)
              else max(sat_writing)
            end
    from value_of_median
);
-- link soal: https://platform.stratascratch.com/coding/9610-find-students-with-a-median-writing-score?code_type=1