-- hitung perbedaan/selisih closing price tiap bulan berurutan
-- hitung perbedaan/selisih closing price bulan ini dan 3 bulan sebelumnya
SELECT date,
        close,
        close - lag(close,1) over(order by date),-- difference with 1 month before
        close - lag(close,3) over(order by date)-- difference with 3 month before
FROM stock_prices;
-- link soal: https://datalemur.com/questions/sql-bloomberg-stock-performance