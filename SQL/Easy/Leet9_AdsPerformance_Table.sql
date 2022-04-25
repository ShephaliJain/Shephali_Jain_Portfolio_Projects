-- Leetcode: https://leetcode.com/problems/ads-performance/
--(ad_id, user_id) is the primary key for Ads table.
--Each row of this table contains the ID of an Ad, the ID of a user, and the action taken by this user regarding this Ad.
--The action column is an ENUM type of ('Clicked', 'Viewed', 'Ignored').

-- Create Table
USE Leetcode;
Create table Ads (ad_id int, user_id int, primary key (ad_id, user_id), action varchar(20));
--Create type actname as ENUM ('Clicked', 'Viewed', 'Ignored');
--Truncate table Ads
insert into Ads (ad_id, user_id, action) values ('1', '1', 'Clicked')
insert into Ads (ad_id, user_id, action) values ('2', '2', 'Clicked')
insert into Ads (ad_id, user_id, action) values ('3', '3', 'Viewed')
insert into Ads (ad_id, user_id, action) values ('5', '5', 'Ignored')
insert into Ads (ad_id, user_id, action) values ('1', '7', 'Ignored')
insert into Ads (ad_id, user_id, action) values ('2', '7', 'Viewed')
insert into Ads (ad_id, user_id, action) values ('3', '5', 'Clicked')
insert into Ads (ad_id, user_id, action) values ('1', '4', 'Viewed')
insert into Ads (ad_id, user_id, action) values ('2', '11', 'Viewed')
insert into Ads (ad_id, user_id, action) values ('1', '2', 'Clicked');


select * from ads;
