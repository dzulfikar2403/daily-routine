-- Write your PostgreSQL query statement below
select content_id,
        content_text as original_text,
        initcap(content_text) as converted_text
from user_content
-- link soal: https://leetcode.com/problems/first-letter-capitalization-ii