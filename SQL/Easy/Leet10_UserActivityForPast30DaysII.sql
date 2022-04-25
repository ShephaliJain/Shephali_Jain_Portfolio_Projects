--leetcode: https://leetcode.com/problems/user-activity-for-the-past-30-days-ii/
-- There is no primary key for this activity table, it may have duplicate rows.
--The activity_type column is an ENUM of type ('open_session', 'end_session', 'scroll_down', 'send_message').
--The table shows the user activities for a social media website. 
--Note that each session belongs to exactly one user.

-- Write an SQL query to find the average number of sessions per user for a period of 30 days 
-- ending 2019-07-27 inclusively, rounded to 2 decimal places. 
--The sessions we want to count for a user are those with at least one activity in that time period.
use leetcode;
select * from activity;
with session_counts as(
select user_id,cast(count(distinct session_id)as float) as session_cnt
from activity
--where activity_type in ('scroll_down','send_message')
where (datediff(day, activity_date, '2019-07-27')) < 30
group by user_id)

select cast(round(sum(session_cnt)/count(session_cnt),2) as float) as average_sessions_per_user
from session_counts;
-------------------------------------------------------------------------------------------------
WITH tmp AS (
SELECT 
DISTINCT 
user_id
,CAST(COUNT(DISTINCT session_id) AS FLOAT) AS session_cnt
FROM Activity 
WHERE (DATEDIFF(day,activity_date,'2019-07-27'))<30 
GROUP BY user_id
)

SELECT ISNULL(ROUND(AVG(session_cnt),2),0) AS average_sessions_per_user
FROM
tmp
-------------------------------------------------------------------------------------------------
-- MYSQL:
-- Write your MySQL query statement below
with cte as(
select distinct user_id, count(distinct(session_id)) as session_count
   from Activity
    where activity_date between date_sub("2019-07-27",interval 29 day) and "2019-07-27"
  GROUP BY user_id)

select round(avg(session_count),2) as average_sessions_per_user
from cte;
having average_sessions_per_user>=1;

#SELECT ROUND(AVG(session_count),2) AS average_sessions_per_user
#FROM cte
#having average_sessions_per_user>=1;


SELECT ROUND(COALESCE(AVG(session),0),2) AS average_sessions_per_user FROM (
SELECT DISTINCT user_id, COUNT(DISTINCT session_id) AS session FROM Activity
WHERE activity_date > DATE_SUB("2019-07-27", INTERVAL 30 DAY)
GROUP BY user_id
HAVING session >= 1
) AS tmp;