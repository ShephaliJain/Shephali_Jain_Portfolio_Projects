use PineValley_1;

select CustomerState , count(*) as Count_Customers
from Customer_T
Group by CustomerState
Having count(*) >= 2