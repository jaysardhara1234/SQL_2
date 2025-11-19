create database if not exists Project_2;

use project_2;

create table customers (
CustomerID int primary key ,
FirstName varchar(100),
LastName varchar(100),
Email varchar(100),
RegistrationDate date 
);

insert into customers (CustomerID , FirstName , LastName , Email, RegistrationDate) values 
(1 , 'John' , 'Doe' , 'johndoe12@gamil.com', '2022-03-25'),
(2 , 'Jane' , 'Smith' , 'janesmith34@gamil.com', '2021-04-20'),
(3 , 'Alice' , 'Steven' , 'alicest@gamil.com', '2020-07-14'),
(4 , 'Bob' , 'Olivia' , 'bobolivi10@gamil.com', '2028-10-10');


create table orders (
OrderID int primary key ,
CustomerID int,
foreign key (CustomerId) references Customers (CustomerID),
OrderDate date,
TotalAmount int
);


insert into orders (OrderID , CustomerID , OrderDate , TotalAmount) Values
(101 , 1 , '2023-07-01' , 150),
(102 , 2 , '2023-07-03' , 200),
(103 , 3 , '2023-07-15' , 135),
(104 , 4 , '2023-07-22' , 270);


create table employees (
EmployeeID int primary key ,
First_Name varchar(100),
Last_Name varchar(100),
Department varchar (100),
HireDate date ,
Salary int
);

insert into employees (EmployeeID , First_Name , Last_Name , Department , HireDate , Salary) Values 
(1 , 'Mark' , 'Johnson' , 'Sales' , '2020-01-15' , 50000),
(2 , 'Susan' , 'Hill' , 'HR' , '2021-03-20' , 55000),
(3 , 'Issy' , 'Wong' , 'Marketting' , '2019-07-09' , 45000),
(4 , 'Amy' , 'Jones' , 'Finance' , '2029-10-27' , 70000);

-- Query 1 --


select  o.OrderID , o.TotalAmount, o.OrderDate , c.CustomerID , c.FirstName , c.LastName from orders as o 
inner join customers as c on o.CustomerId = c.CustomerId;


-- Query 2 --


select c.CustomerID , c.FirstName , c.LastName , o.OrderID , o.TotalAmount from customers as c 
left join orders as o on c.CustomerId = o.CustomerId;	


-- Query 3 --


SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.TotalAmount FROM Customers as c
RIGHT JOIN Orders as o ON c.CustomerID = o.CustomerID;		


-- Query 4 --


select * from customers as c 
left join orders as o on c.CustomerId = o.CustomerId	
union
SELECT * FROM Customers as c
RIGHT JOIN Orders as o ON c.CustomerID = o.CustomerID;


-- Query 5 --


select * from customers
 where customerID in (select CustomerID from orders where Totalamount > 
 (select avg(TotalAmount) from orders ) 
 );		


-- Query 6 --


select * from employees 
where salary > (select avg(salary) from employees);


-- Query 7 --


select OrderId ,
year (OrderDate) as OrderYear,
month (OrderDate) as OrderMonth
from orders;


-- Query 8 --


select OrderID,
DATEDIFF(CURDATE(), OrderDate) AS Difference_days
FROM Orders;


-- Query 9 --


select OrderID,
date_format(OrderDate , '%d-%m-%Y') as Custom_date
from orders;


-- Query 10 --


select concat(FirstName , ' ' , LastName) as Full_Name
from customers;


-- Query 11 --


select replace (FirstName , 'John', 'Jonathan') as Updated_Name
from customers;


-- Query 12 --


select CustomerID , FirstName , LastName ,
upper(FirstName) as UpperCase_Name,
lower(LastName) as LowerCase_Name 
from customers;


-- Query 13 --


select TRIM(Email) AS Clean_Email
FROM Customers;


-- Query 14 --


select OrderDate , OrderID , TotalAmount ,
sum(TotalAmount) over (order by OrderDate) as Running_Total
from orders;


-- Query 15 --


select * , dense_rank() over (order by TotalAmount desc) Ranking
from orders;


-- Query 16 --


select * , case
when TotalAmount >=200 then '15% Discount'
when TotalAmount >=100 then '10% Discount'
else 'No Discount'
end as Discount
from orders;


-- Query 17 --


select * , case 
when salary >=65000 then 'High'
when salary >=50000 then 'Medium'
else 'Low'
end as Salary_Grade
from employees;


-- Project Over --