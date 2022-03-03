use classicmodels;

-- 1
select * from employees;
SELECT firstName, count(lastName), jobTitle, lastName
FROM employees 
where lastName != ''
group by lastName
having count(lastName) = 1;

-- 2
SELECT * FROM customers ORDER BY contactLastName ASC;

-- 3
SELECT * from offices;
SELECT * from employees;
SELECT * from employees WHERE officeCode IN ('1', '2', '3');

-- 4
select * from orderdetails;
select orderLineNumber, sum(priceEach) from orderdetails group by orderLineNumber with rollup order by sum(priceEach);

-- 5
select * from employees where extension like '%x2%';

-- 6
select * from employees where jobTitle like '%Sales Rep%';

-- 7
select * from employees where substring(lastName, -3) like '%son%';

-- 8
select city, count(city) as population
from offices join employees using (officeCode)
group by city
order by count(city) desc
limit 2;

-- 9
select customerName, state, creditLimit
from customers
where state = 'CA' and creditLimit > 100000;

-- 10
select customerName, country
from customers
where country = 'Singapore' or country = 'France';

-- 11
select * from employees
where officeCode <= 4;

-- 12
select customerName, status from orders join customers using (customerNumber)
where status = 'On Hold';

-- 13
select * from employees
where reportsTo is NULL;

-- 14 ???
-- select distinct lastName from employees;

-- 15 ???
select distinct city, state
from customers;

-- 16
select productName, productCode, priceEach, quantityOrdered, max(priceEach * quantityOrdered) AS maxSold from orderdetails join products using(productCode);

-- 17
-- select * from customers
-- where customer_id = ANY
-- (select customer

-- 18
select customerName, shippedDate, requiredDate from orders join customers using(customerNumber)
where datediff(requiredDate, shippedDate) < 5;

-- 19 - alias?
select orderNumber, customerName from customers left join orders on customers.customerNumber = orders.customerNumber;

-- 20
select * from employees right join customers on customers.salesRepEmployeeNumber = employees.employeeNumber;

-- 21 ???
select * from orders;
select * from orderdetails;

-- 22 ???
-- select c.customerName, c.city, d.city from customers on(c.city = d.city);

-- 23
select customerName, productName, orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber from customers join orders using(customerNumber) join orderdetails using(orderNumber) join products using (productCode);

-- 24
select priceEach from orderdetails join products using(productCode) where productCode = 'S10_1678' and priceEach < MSRP;


