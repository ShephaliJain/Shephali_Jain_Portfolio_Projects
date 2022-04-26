use PineValley_1;
select c.CustomerID, count(o.orderid) as no_of_orders
from Customer_T c, Order_T o
where c.CustomerID = o.CustomerID
group by c.CustomerID
having count(distinct o.orderid) > 1