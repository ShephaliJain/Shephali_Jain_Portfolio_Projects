--Similar problem from Leetcode: https://leetcode.com/problems/group-sold-products-by-the-date/

-- String_Agg() function usage demonstration
--If you are working on SQL Server 2017 or later versions:
--you can use built-in SQL Server Function STRING_AGG to create the comma delimited list

use Leetcode;
Create table Table1 (ID INT, Value INT);
INSERT INTO Table1 VALUES (1,100),(1,200),(1,300),(1,400);

select * from table1;

SELECT ID , STRING_AGG([Value], ', ') AS List_Output
FROM Table1
GROUP BY ID;