use PineValley_1;
--Solution way 1: using min and max functions
select p.productdescription,
		min(p.productfinish) as productfinish1,
		max(p.productfinish) as productfinish2
from Product_T p
group by p.ProductDescription
having count(p.productfinish) = 2;


----------------------------------------------------------------
-- Another way to solve it
Select  ProductDescription, 
max(case when AA.Rank_As = 1 then ProductFinish end) as Finish1,
max(case when AA.rank_as = 2 then ProductFinish end) as Finish2 
from(
select distinct productdescription,productfinish,
Rank() over(partition by productdescription order by productID) as Rank_as
from Product_T p
where productdescription in 
(
select amz.Productdescription
from 
(select Productdescription, 
count(distinct productID) as cc
from Product_T
group by ProductDescription
having  count(distinct ProductID) = 2
) amz
)
) aa
group by ProductDescription

----------------------------------
-- solving way 3: via self join