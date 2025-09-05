SELECT extract(month from submit_date) as month,
      product_id,
      round(avg(stars),2) as avg_stars
FROM reviews
group by month,product_id
order by month,product_id;
-- link soal: https://datalemur.com/questions/sql-avg-review-ratings