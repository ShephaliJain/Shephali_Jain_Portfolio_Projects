use PineValley_1;
select distinct c.CustomerID, customername, 
customeraddress, customercity, customerstate, customerpostalcode 
from Customer_T c, order_T o
where o.customerID = c.customerID

