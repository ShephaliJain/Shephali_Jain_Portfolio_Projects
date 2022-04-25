-- Leetcode: https://leetcode.com/problems/department-highest-salary/
-- Write an SQL query to find employees who have the highest salary in each of the departments.
-- Return the result table in any order.

Use LMQ;
--select * from Employee;
--select * from Department;

-- SOlution 1: OPtimized:
with cte as (select a.name as Department,b.name as Employee ,b.salary,
dense_rank() over(partition by b.departmentId order by salary desc ) as MaxSalary 
from department a join employee b on a.id=b.departmentId)

select Department,Employee,salary from cte where Maxsalary=1;

-- Solution 2------------------------------------------------------------------------------
with cte as(
select d.name as Department, e.name as Employee, e.salary as Salary
from employee e
left join department d
on e.departmentid = d.id),
cte1 as(
select *, dense_rank() over (partition by department order by salary desc) as dense_rank
from cte)

select Department, Employee, Salary from cte1
where dense_rank = '1';
