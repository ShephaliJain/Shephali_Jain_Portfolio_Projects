use PineValley_1;
Select sum(ol.OrderedQuantity) as ComputerDesk_OrderedCount
from OrderLine_T ol, Product_T p
where p.ProductID = ol.ProductID AND ol.productID in ('3','8')


