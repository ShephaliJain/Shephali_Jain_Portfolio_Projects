-- Print 1 to 100 numbers in SQL
---------Solution1: Using recursive CTE---------------------------------------------
 with CTE as  
( select 1 digit  
 union all  
 select digit +1 from CTE where digit <100  
)   
  select * from cte;

  -------------------------------------------Solution2----------------------------------------
-- Using While Loops
DECLARE @V1 INT
SET @V1=0
WHILE (@V1<100)
BEGIN
SET @V1=@V1+1
PRINT @V1
END;
---- Solution 3: Using GOTO---------------------------------------------------------------------

DECLARE @V1 INT
SET @V1=0
LABEL:
SET @V1=@V1+1
PRINT @V1
IF (@V1<>100)
GOTO LABEL;

----- Solution 4: Using "row_number() + master.sys.columns"-------------------------------------------------------------
SELECT TOP (100) ROW_NUMBER() OVER (ORDER BY Object_id) as count
FROM master.sys.columns;