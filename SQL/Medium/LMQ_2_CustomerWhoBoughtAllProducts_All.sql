-- leetcode: https://leetcode.com/problems/customers-who-bought-all-products/
-- There is no primary key for Customer table. It may contain duplicates.
--product_key is a foreign key in Customer table to Product table and is primary key in Product table.

--Write an SQL query to report the customer ids from the Customer table that bought all the products in the Product table.
--Return the result table in any order.

Use lmq;
Create table Customer (customer_id int, product_key int)
Create table Product (product_key int, primary key (product_key))
--Truncate table Customer
insert into Customer (customer_id, product_key) values ('1', '5')
insert into Customer (customer_id, product_key) values ('2', '6')
insert into Customer (customer_id, product_key) values ('3', '5')
insert into Customer (customer_id, product_key) values ('3', '6')
insert into Customer (customer_id, product_key) values ('1', '6')
--Truncate table Product
insert into Product (product_key) values ('5')
insert into Product (product_key) values ('6')

Select * from customer;
Select * from product;
--solution:
with purchase as (
select customer_id,
count(distinct product_key) ct
from Customer
group by customer_id),
warehouse as (
select count(distinct product_key) ct
from Product)
select customer_id
from purchase
join warehouse
on purchase.ct =warehouse.ct;
----------------------------------------------------------------------------
--Solution
with all_prod as (
    select count(1) as total_prod
    from product)
select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select total_prod from all_prod);

--most optimized solution using windows function:
with t as(
select distinct customer_id, product_key
from customer
), c_count as(
select customer_id, count( customer_id) over(partition by customer_id) as cust_count
from t
)
select distinct customer_id
from c_count
where cust_count = (select count(product_key) from product);

-- my solution but marked incorrect by leetcode:
select a.customer_id from customer a
left join product b
on a.product_key = b.product_key
group by a.customer_id
having count(distinct a.product_key) > 1
order by a.customer_id;