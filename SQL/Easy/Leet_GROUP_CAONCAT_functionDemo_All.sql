--Similar problem from Leetcode: https://leetcode.com/problems/group-sold-products-by-the-date/
-- group_concat(): https://www.geeksforgeeks.org/mysql-group_concat-function/?msclkid=cbc1e85fb6bc11eca5a1efd460f26d58
-- the code will not work here in ssms, try in mysql.
--The GROUP_CONCAT() function in MySQL is used to concatenate data from multiple rows into one field.
--This is an aggregate (GROUP BY) function which returns a String value, if the group contains at least one non-NULL value. 
--Otherwise, it returns NULL.

Create table employee (emp_id int, fname varchar(20), lname varchar(20), dept_id int, strength varchar(30))
insert into employee( emp_id, fname, lname, dept_id, strength) values ('1','Mukesh','Gupta','2','Leadership');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('3','Neelam','Sharma','3', 'Hard-working');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('1','Mukesh','Gupta','2', 'Responsible');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('2','Devesh','Tyagi','2', 'Punctuality');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('3','Neelam','Sharma','3', 'Self-motivated');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('1','Mukesh','Gupta','2', 'Quick-Learner');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('4','Keshav','Singhal','3', 'Critical thinking');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('1','Mukesh','Gupta','2', 'Leadership');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('5','Tanya','Jain','1', 'Hard-Working');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('4','Keshav','Singhal','3', 'Listening');
insert into employee( emp_id, fname, lname, dept_id, strength) values ('5','Tanya','Jain','1', 'Goal-Oriented');

select * from employee;
--1. Using simple GROUP_CONCAT() function-

SELECT emp_id, fname, lname, dept_id, 
GROUP_CONCAT ( strength ) as "strengths" 
FROM employee group by emp_id;


--SELECT col1, col2, ..., colN
--GROUP_CONCAT ( [DISTINCT] col_name1 
--[ORDER BY clause]  [SEPARATOR str_val] ) 
--FROM table_name GROUP BY col_name2;

--col1, col2, ...colN : These are the column names of table.
--col_name1: Column of the table whose values are concatenated into a single field for each group.
--table_name: Name of table.
--col_name2: Column of the table according to which grouping is done.