use PineValley_1;

select productid, sum(orderedquantity) as Total_Quantity
from OrderLine_T ol
group by productid
order by Total_Quantity desc;
