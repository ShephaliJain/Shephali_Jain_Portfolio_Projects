-- Leetcode: https://leetcode.com/problems/sellers-with-no-sales/
--Write an SQL query to report the names of all sellers who did not make any sales in 2020.
-- Return the result table ordered by seller_name in ascending order.

Use SellersWithNoSales;
select * from Customer;
select * from Orders;
select * from Seller;


select s.seller_name from seller s
--  left join orders o
--  on o.seller_id = s.seller_id
where seller_id not in (select seller_id from orders where   Datepart(YEAR, sale_date)  ='2020' ) 
order by s.seller_name;

