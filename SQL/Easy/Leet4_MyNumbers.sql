-- leetcode: https://leetcode.com/problems/biggest-single-number/

-- There is no primary key for this table. It may contain duplicates.
-- Each row of this table contains an integer.A single number is a number that appeared only once in the MyNumbers table.
-- Write an SQL query to report the largest single number. If there is no single number, report null.

Use Leetcode;

select * from MyNumbers;

-- Solution 1: acceptable with null condition

select max(num) as num
from (
	select num
	from MyNumbers
	group by num
	having count(*) = 1
) t;

--Solution 2: without null
Select top 1 case when count(num)=1 then num else null end as num
from MyNumbers
group by num
having count(num)=1
order by num desc;

