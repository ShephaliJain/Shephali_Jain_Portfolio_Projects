--Leetcode: https://leetcode.com/problems/duplicate-emails/

-- Each row of this table contains an email. The emails will not contain uppercase letters.
-- Write an SQL query to report all the duplicate emails. Return the result table in any order.

Use Leetcode;

select distinct p1.email from person p1, person p2
where p1.email = p2.email and p1.id != p2.id
order by p1.email;