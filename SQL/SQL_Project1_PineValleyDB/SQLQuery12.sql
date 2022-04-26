use PineValley_1;
select c.CustomerID, c.CustomerName, p.productid, p.ProductDescription
from Customer_T c, Order_T o, Product_T p, OrderLine_T ol
where c.CustomerID = o.CustomerID 
AND o.orderID = ol.OrderID 
and ol.productId = p.productID 


