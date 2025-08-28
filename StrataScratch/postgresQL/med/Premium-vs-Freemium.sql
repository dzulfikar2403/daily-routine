-- cari total number download yang paying dan non paying by date
-- include record customer non paying lebih banyak downloadnya dari yang cust paying
-- order by date asc
with total_download_by_subscribe_per_each_date as (
    select mdf.date,
            sum(mdf.downloads) filter (where mad.paying_customer = 'no') as non_paying,
            sum(mdf.downloads) filter (where mad.paying_customer = 'yes') as paying
    from ms_download_facts mdf
    left join ms_user_dimension mud on (mdf.user_id = mud.user_id)
    inner join ms_acc_dimension mad on (mud.acc_id = mad.acc_id)
    group by mdf.date
    order by mdf.date
)
select *
from total_download_by_subscribe_per_each_date
where non_paying > paying;
-- link soal: https://platform.stratascratch.com/coding/10300-premium-vs-freemium?code_type=1