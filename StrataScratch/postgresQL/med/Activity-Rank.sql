select from_user,
        count(to_user) total_emails,
        row_number() over(
            order by count(to_user) desc, from_user asc
        )
from google_gmail_emails
group by from_user;
-- link soal: https://platform.stratascratch.com/coding/10351-activity-rank?code_type=1