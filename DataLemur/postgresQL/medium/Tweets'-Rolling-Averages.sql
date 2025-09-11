SELECT user_id,
      tweet_date,
      round(avg(tweet_count) over(
        partition by user_id
        order by tweet_date asc
        range between '2day' preceding and current row
      ) ,2) as rolling_avg_3d
FROM tweets;
-- link soal: https://datalemur.com/questions/rolling-average-tweets