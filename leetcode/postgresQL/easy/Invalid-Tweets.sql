-- Write your PostgreSQL query statement below
select tweet_id
from tweets 
where length(content) > 15; 
-- disarankan mengunakan char_length(). karena length menghitung panjang berdasarkan byte, bukan string char.