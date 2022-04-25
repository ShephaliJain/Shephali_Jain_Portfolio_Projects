--Leetcode: https://leetcode.com/problems/delete-duplicate-emails/
-- id is the primary key column for this table.
--Each row of this table contains an email. The emails will not contain uppercase letters.
--Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.
--Return the result table in any order.
Use leetcode;

Create table Persons (Id int, Email varchar(255), primary key (id))
--Truncate table Persons
insert into Persons (id, email) values ('1', 'john@example.com')
insert into Persons (id, email) values ('2', 'bob@example.com')
insert into Persons (id, email) values ('3', 'john@example.com')

select * from persons;

delete p1 from persons p1, persons p2
where p1.email = p2.email and p1.id >p2.id
select * from persons;