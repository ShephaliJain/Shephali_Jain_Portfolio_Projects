-- letcode:https://leetcode.com/problems/duplicate-emails/
-- id is the primary key column for this table.

Use leetcode;

Create table Person (id int, email varchar(255), PRIMARY KEY(id));
--Truncate table Person
insert into Person (id, email) values ('1', 'a@b.com')
insert into Person (id, email) values ('2', 'c@d.com')
insert into Person (id, email) values ('3', 'a@b.com')

--select * from Person;
