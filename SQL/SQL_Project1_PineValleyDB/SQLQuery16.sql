use PineValley_1;

select A.ProductDescription,A.ProductStandardPrice, A.Units_ordered, A.SalesAmount
from( select p.ProductID, p.ProductDescription, p.ProductStandardPrice,
sum(ol.OrderedQuantity) as Units_ordered, 
sum(p.ProductStandardPrice * ol.OrderedQuantity) as SalesAmount
from OrderLine_T ol, Product_T p
where ol.productid = p.productid
group by p.Productid, p.ProductDescription, p.ProductStandardPrice) A
