use PineValley_1;

select productid, productdescription, productfinish
from Product_T
where ProductFinish like '%ash%';