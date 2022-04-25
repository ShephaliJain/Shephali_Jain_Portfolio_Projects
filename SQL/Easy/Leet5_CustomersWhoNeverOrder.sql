-- leetcode: https://leetcode.com/problems/customers-who-never-order/
-- Write an SQL query to report all customers who never order anything. Return the result table in any order.
Use Leetcode;

select c.name as Customers from customers c
where  c.id not in (select customerid from orders)