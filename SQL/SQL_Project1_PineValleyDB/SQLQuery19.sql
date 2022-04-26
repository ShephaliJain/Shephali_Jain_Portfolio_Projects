use PineValley_1;

select customerid, CustomerName
from Customer_T
where CustomerState in ('CA','WA');