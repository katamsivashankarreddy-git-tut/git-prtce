create database sqluse;
use sqluse;
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    age INT
);
INSERT INTO customers (first_name, last_name, country, age) VALUES
('Alice', 'Johnson', 'USA', 28),
('Bob', 'Smith', 'Canada', 35),
('Carlos', 'Diaz', 'Mexico', 42),
('Diana', 'Lee', 'USA', 31),
('Ethan', 'Brown', 'UK', 25);

select * from customers;

select first_name from customers;

select last_name from customers;

select * from customers where age > 20;
select * from customers where age > 30;
select * from customers where age < 20;
select * from customers where age = 42;
select * from customers where country = 'UK';
select * from customers where COUNTRY = 'CANADA';
select AGE  from customers where COUNTRY = 'USA';
select * from customers where age > 20 and country = 'usa';
select * from customers where age between 20 and 30;
select * from customers
order by age desc;
select * from customers order by country desc;
select age from customers order by first_name desc;
select * from customers limit 3;
select first_name from customers limit 4;
select count(*) from customers;
select count(age) from customers;
select count(first_name) from customers;
select count(last_name) from customers;
select count(country) from custromers;
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;
select * from customers;
select age, count(*) as toal_age
from customers
group by age;
update customers
set age = age+1;
select * from customers;
update customers
set age = age+10;
select * from customers;
update customers
set age = age+5;
update customers
set country = 'IND' where country = 'usa';
select * from customers;
update customers
set country = 'aus' where age > 45;
select * from customers;
update customers
set country = 'sa' where last_name = 'smith';
update customers
set first_name = 'shiva' where country = 'ind';
select * from customers;
update customers
set last_name = 'katam' where age between 30 and 55;
select * from customers;



