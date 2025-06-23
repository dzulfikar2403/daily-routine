select survived,
        count(pclass) filter (where pclass = 1) as first_class,
        count(pclass) filter (where pclass = 2) as second_class,
        count(pclass) filter (where pclass = 3) as third_class
from titanic
group by survived;
-- link soal: https://platform.stratascratch.com/coding/9881-make-a-report-showing-the-number-of-survivors-and-non-survivors-by-passenger-class?code_type=1