-- Leetcode: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
--Write an SQL query to find the IDs of the users who visited without making any transactions 
-- and the number of times they made these types of visits.
--Return the result table sorted in any order.
USE SellersWithNoSales;

Select * from visits;
select * from Transactions;

select v.customer_id, count(v.customer_id) as count_no_trans from visits v
left join transactions t
on v.visit_id = t.visit_id
where t.transaction_id is null
group by v.customer_id
order by count_no_trans desc;