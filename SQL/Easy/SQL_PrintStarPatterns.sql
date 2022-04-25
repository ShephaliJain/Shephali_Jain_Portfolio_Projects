-- Print * patterns in sql
--Pattern 1
DECLARE @var int			 -- Declare
SELECT @var = 5				 -- Initialization
WHILE @var > 0				 -- condition
BEGIN						 -- Begin
PRINT replicate('* ', @var) -- Print
SET @var = @var - 1			-- decrement
END	;						-- END

--Pattern 2
DECLARE @var int, @x int				 -- declare two variable
SELECT @var = 4,@x = 1				 -- initialization
WHILE @x <=5							 -- condition
BEGIN
PRINT space(@var) + replicate('*', @x) -- here space for -- create spaces
SET @var = @var - 1					 -- set
set @x = @x + 1						 -- set
END	;								 -- End
