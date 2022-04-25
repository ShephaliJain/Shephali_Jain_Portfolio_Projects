-- Print a to z in sql

declare @var int
set @var = 65
-- start while loop as a =65, z=90
while(@var < 90)
begin
print char(@var)
set @var = @var + 1
end;