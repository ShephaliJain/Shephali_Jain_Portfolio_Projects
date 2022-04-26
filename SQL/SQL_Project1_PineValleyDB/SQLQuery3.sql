use PineValley_1;

select CustomerName, CustomerAddress, CustomerCity,
CustomerState, CustomerPostalCode
from Customer_T
ORDER BY CustomerState, CustomerCity;