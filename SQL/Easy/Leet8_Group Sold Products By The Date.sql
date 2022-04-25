-- Leetcode: https://leetcode.com/problems/group-sold-products-by-the-date/

-- There is no primary key for this table, it may contain duplicates.
--Each row of this table contains the product name and the date it was sold in a market.
-- Write an SQL query to find for each date the number of different products sold and their names.
-- The sold products names for each date should be sorted "lexicographically".
-- Return the result table ordered by sell_date.
-- Important: group_concat() is the most optimized way to solve this as it takes only 556 ms to run (< 2321 ms for string_agg())
-- read on: https://www.geeksforgeeks.org/mysql-group_concat-function/?msclkid=cbc1e85fb6bc11eca5a1efd460f26d58
Use SellersWithNoSales;
select * from activities;

-- Sol1: Incomplete; using string_agg(); Initially could get this answer, but lexicographically its not sorted by products
-- mask is repeated in products
SELECT Sell_date ,  count(distinct product) as num_sold, STRING_AGG(product, ',') AS products
FROM activities
GROUP BY sell_date
order by sell_date;

--fully correct solution: need to eliminate repeated values
select A.sell_date, 
    COUNT(product) AS num_sold,
    STRING_AGG(product, ',') AS products
from ( Select distinct * from Activities ) as A
group by A.sell_date;

--Sol2: using "within group" function; by default ordered by s
select sell_date,count(product)[num_sold],
string_agg(product,',')
within group(order by product)[products]
from(
select distinct(product),sell_date from Activities)as tbl
group by sell_date
-----------MYSQL solutions---------------------------------
SELECT
sell_date,
COUNT(DISTINCT product) as num_sold,
GROUP_CONCAT(DISTINCT product
ORDER BY product ASC
SEPARATOR ',') as products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date asc;

--Sol:MySQL solution; using group_concat(); allows row sorting also
select sell_date, count(distinct product) as num_sold, 
group_concat(distinct product order by product) as products 
from Activities 
group by sell_date;

