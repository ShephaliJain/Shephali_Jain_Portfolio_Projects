use [LDO];
select distinct *
from appointment a
join staff s
on a.staffid = s.staffid
join payment p
on s.staffid = p.staffid