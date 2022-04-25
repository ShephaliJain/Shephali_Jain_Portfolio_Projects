--Leetcode: https://leetcode.com/problems/highest-grade-for-each-student/
--(student_id, course_id) is the primary key of this table.
 --Write a SQL query to find the highest grade with its corresponding course for each student.
 -- In case of a tie, you should find the course with the smallest course_id.
-- Return the result table ordered by student_id in ascending order.
use lmq;
Create table Enrollments (student_id int, course_id int, grade int, primary key (student_id,course_id))
--use lmq;Drop table enrollments;
insert into Enrollments (student_id, course_id, grade) values ('2', '2', '95')
insert into Enrollments (student_id, course_id, grade) values ('2', '3', '95')
insert into Enrollments (student_id, course_id, grade) values ('1', '1', '90')
insert into Enrollments (student_id, course_id, grade) values ('1', '2', '99')
insert into Enrollments (student_id, course_id, grade) values ('3', '1', '80')
insert into Enrollments (student_id, course_id, grade) values ('3', '2', '75')
insert into Enrollments (student_id, course_id, grade) values ('3', '3', '82')

select * from enrollments;

with cte as(
select *, dense_rank() over (partition by student_id order by grade desc,course_id asc) as Max_grader
from enrollments)

select student_id, course_id, grade, Max_grader from cte
where Max_grader = '1';