use PineValley_1;
Select A.productID, A.ProductDescription
From(select productID , productdescription,productstandardprice,
RANK() over (order by productStandardprice DESC) as Highest_Price_Rank
from Product_T) A
where Highest_Price_Rank =1;

select TOP 1 productid, productdescription
from Product_T
order by ProductStandardPrice DESC;