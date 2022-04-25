

use leetcode;

CREATE TABLE NAMES (student_id int,student_name varchar(20))
INSERT INTO NAMES (student_id, student_name) values ('1', 'Shubh')
INSERT INTO NAMES (student_id, student_name) values ('2', '%Amit')
INSERT INTO NAMES (student_id, student_name) values ('3', 'Shubhangi')
INSERT INTO NAMES (student_id, student_name) values ('4', '%Kunal')

select * from names;

select student_name from names 
where student_name like '[%]%'