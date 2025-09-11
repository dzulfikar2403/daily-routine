SELECT account_id,
        sum(CASE
            when transaction_type = 'Deposit' then amount
            else -amount
        end)
FROM transactions
group by account_id;
-- link soal: https://datalemur.com/questions/final-account-balance