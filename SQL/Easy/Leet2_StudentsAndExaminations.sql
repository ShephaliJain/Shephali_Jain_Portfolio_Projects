-- Leetcode: https://leetcode.com/problems/students-and-examinations/
-- Write an SQL query to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.
Use Leetcode;
-- SSMS solution
select esp.student_id , student_name, esp.subject_name, isnull(count(exam.subject_name),0) as attended_exams
from (select * from students, subjects) as esp
    left join examinations as exam 
    on esp.student_id = exam.student_id 
    and esp.subject_name = exam.subject_name
  
group by esp.student_id ,student_name, esp.subject_name
order by esp.student_id ,student_name;
------------------------------------------------------------------------------------------------------------------------
-- mysql solution
SELECT
    student_id,
    student_name,
    subject_name, 
    IfNULL(ct, 0) AS attended_exams --final columns in the output but ifnull is not an inbuilt function in ssms, works in mysql.
FROM
    Students
    CROSS JOIN --cross join joins every row in table 1 with every row in table 2
    Subjects
    LEFT JOIN --left join because you want everything you've got so far in the output
    (SELECT student_id, subject_name, COUNT(*) AS ct
     FROM Examinations
     GROUP BY student_id, subject_name) AS a --every derived table needs an alias
     USING (student_id, subject_name) -- with using, you don't need to specify the table names
ORDER BY
    student_id,
    subject_name;