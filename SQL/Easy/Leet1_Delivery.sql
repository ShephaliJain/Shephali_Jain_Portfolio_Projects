-- leetcode: https://leetcode.com/problems/immediate-food-delivery-i/
-- delivery_id is the primary key of this table.
-- The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
-- If the customer preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
-- Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.

Use Leetcode;
	select * from dbo.Delivery;
	with cte as(
	select  count(case when Order_Type = 'immediate' then delivery_id end)  as imm ,
			count(case when Order_Type = 'schedule' then delivery_id end)  as sch,
			count(delivery_id)  as total
	from (
	select delivery_id,
	case 
		when order_date = customer_pref_delivery_date then 'immediate'
		when order_date < customer_pref_delivery_date then 'schedule'
		else 'The date is invalid entry'
		end as Order_Type
		from delivery) aa)

		select round(cast(cast(imm as float)/cast(total as float) as float ) * 100 ,2) as immediate_percentage,
		round(cast(cast(sch as float)/cast(total as float) as float ) * 100 ,2) as schedule_percentage
		from cte;

	

   