-- Leetcode: https://leetcode.com/problems/ads-performance/
--(ad_id, user_id) is the primary key for Ads table.
--Each row of this table contains the ID of an Ad, the ID of a user, and the action taken by this user regarding this Ad.
--The action column is an ENUM type of ('Clicked', 'Viewed', 'Ignored').

use Leetcode;
-- Mysql sol1:
select * from ads;
with cte as(
select ad_id, count(case when action = 'Clicked' then user_id end) as ctr_c,
count( case when action = 'Viewed' then user_id end) as ctr_v
from ads
group by ad_id);
-- Mysql sol2:
select ad_id, case
    when isnull(round(ctr_c/(ctr_c + ctr_v)* 100,2),0) then 0
               else round(ctr_c/(ctr_c + ctr_v)* 100,2) 
                end as ctr
from cte
order by ctr desc, ad_id;

select ad_id, 
        round(
            ifnull(sum(case when action in ('Clicked') then 1 else 0 end)
                    / sum(case when action in ('Clicked', 'Viewed') then 1 else 0 end), 0)*100, 2) as ctr   
from Ads 
group by 1 
order by 2 desc, 1 
