use PineValley_1;
-- better way:
(select o.OrderID
, c.CustomerID
, c.CustomerName
, (c.CustomerAddress + ' ' + c.CustomerCity + ', ' + c.CustomerState + ' ' + c.CustomerPostalCode) as MailingAddress, p.*, ol.OrderedQuantity
, (p.ProductStandardPrice * ol.OrderedQuantity) as TotalForProduct
, (select sum(ol.OrderedQuantity * p.ProductStandardPrice) from Order_T o2
inner join Customer_T c on c.CustomerID = o.CustomerID
inner join OrderLine_T ol on o.OrderID = ol.OrderID
inner join Product_T p on p.ProductID = ol.ProductID
where o.OrderID = o2.OrderID
group by o2.OrderID) as TotalOrderPrice
from Order_T o
inner join Customer_T c on c.CustomerID = o.CustomerID
inner join OrderLine_T ol on o.OrderID = ol.OrderID
inner join Product_T p on p.ProductID = ol.ProductID)

-------------------------------------------------------------------------------------------------
-- old code (to be discarded):
select  ol.orderid, c.customerid, c.CustomerName,
		c.CustomerAddress,c.CustomerCity,
		c.CustomerState,c.CustomerPostalCode,o.OrderDate,
		p.productid, p.ProductDescription,p.ProductFinish,
		p.ProductStandardPrice,
		ol.OrderedQuantity,
		sum(p.ProductStandardPrice * ol.OrderedQuantity) as TotalPrice_Sales
from	Customer_T c, Product_T p, OrderLine_T ol, Order_T o
where	c.CustomerID = o.CustomerID
		AND o.OrderID = ol.OrderID
		AND ol.ProductID = p.ProductID
group by ol.orderid, c.customerid, c.CustomerName,
		c.CustomerAddress,c.CustomerCity,
		c.CustomerState,c.CustomerPostalCode,o.OrderDate,
		p.productid, p.ProductDescription,p.ProductFinish,
		p.ProductStandardPrice,
		ol.OrderedQuantity




