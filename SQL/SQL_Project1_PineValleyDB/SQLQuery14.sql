use PineValley_1;

select sum(ol.OrderedQuantity) as Computer_Desk_Impressions
from OrderLine_T ol, Product_T p, Order_T o, Customer_T c
where c.customername = 'Impressions'
and  c.customerid = o.CustomerID 
AND o.OrderID = ol.OrderID 
and ol.productid = p.productid
and p.ProductDescription = 'Computer Desk';
