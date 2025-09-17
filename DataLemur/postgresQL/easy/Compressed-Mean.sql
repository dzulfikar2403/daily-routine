SELECT round(sum(item_count::NUMERIC * order_occurrences) / sum(order_occurrences),1) as mean
FROM items_per_order; 
-- link soal: https://datalemur.com/questions/alibaba-compressed-mean