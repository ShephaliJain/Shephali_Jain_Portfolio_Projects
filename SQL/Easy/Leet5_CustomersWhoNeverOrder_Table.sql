-- leetcode: https://leetcode.com/problems/customers-who-never-order/
-- Customers:id is the primary key column for this table. Each row of this table indicates the ID and name of a customer.
-- Orders: id is the primary key column for this table. customerId is a foreign key of the ID from the Customers table.
-- Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
Use Leetcode;
Create table Customers ( id int not null, name varchar(255), primary key (id));
Create table Orders ( id int not null, customerId int, PRIMARY KEY (id), FOREIGN KEY (CUSTOMERID) REFERENCES Customers(id));
--Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
--Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

select * from customers;
select * from orders;
