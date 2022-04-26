use PineValley_1;

select ProductFinish, avg(ProductStandardPrice) as AvgStdPrice
from Product_T
group by ProductFinish;