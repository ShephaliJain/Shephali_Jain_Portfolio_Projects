use PineValley_1;

select p.ProductID, sum(ol.OrderedQuantity) as Units_ordered
from OrderLine_T ol, Product_T p
where ol.productid = p.productid
group by p.Productid;

