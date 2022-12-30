-- 0
-- CREATE DATABASE IF NOT EXISTS sms_db;
-- CREATE TABLE IF NOT EXISTS towns (
--     id int PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(50) NOT NULL,
--     mayor_name VARCHAR(60) NOT NULL
-- );
-- CREATE TABLE IF NOT EXISTS customers (
-- id int PRIMARY KEY AUTO_INCREMENT,
-- first_name VARCHAR(30) NOT NULL,
-- last_name VARCHAR(30) NOT NULL,
-- age INT NOT NULL,
-- balance decimal (11, 2) NOT NULL,
-- registered_into_system_on DATETIME NOT NULL,
-- home_town_id INT NOT NULL,
-- constraint FK_towns_customers
-- foreign key (home_town_id)
-- references towns (id)
-- );

-- CREATE TABLE IF NOT EXISTS supermarkets (
-- id int PRIMARY KEY AUTO_INCREMENT,
-- name VARCHAR(50) NOT NULL,
-- number_of_employees INT NOT NULL,
-- is_active BOOL DEFAULT(TRUE),
-- town_id INT NOT NULL,
-- constraint FK_towns_supermarkets
-- foreign key (town_id)
-- references towns (id)
-- );

-- CREATE TABLE IF NOT EXISTS products (
--     id int PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100) NOT NULL,
--     category VARCHAR(30) NOT NULL,
--     price_per_unit decimal(11, 2) NOT NULL
--     );
--     
-- CREATE TABLE IF NOT EXISTS receipts (
-- id int PRIMARY KEY AUTO_INCREMENT,
-- quantity int NOT NULL,
-- purchased_on DATETIME NOT NULL,
-- product_id INT NOT NULL,
-- customer_id INT NOT NULL,
-- supermarket_id INT NOT NULL,
-- constraint FK_receipts_products
-- foreign key (product_id)
-- references products (id),

-- constraint FK_receipts_customers
-- foreign key (customer_id)
-- references customers (id),

-- constraint FK_receipts_supermarkets
-- foreign key (supermarket_id)
-- references supermarkets (id)
-- );

-- 1
-- select id, name, category, price_per_unit from products
-- where category = 'Books' and price_per_unit > 10
-- order by price_per_unit desc, id asc

-- 2
-- select id, first_name, last_name, age, balance from customers
-- where age < 18 and balance > 1000
-- order by balance desc, first_name and last_name asc 

-- 3
-- select id, name, number_of_employees from supermarkets
-- order by number_of_employees desc, name asc

-- 4
-- select concat(first_name," " , last_name) AS full_name, age, balance from customers
-- where id not in
-- (select customer_id from receipts)
-- order by balance desc

-- 5
-- select t.name, count(s.id) as supermatkers, count(c.id) as customers from towns as t
-- join supermarkets as s
-- on t.id = s.town_id
-- join customers as c
-- on t.id = c.home_town_id;

-- 6
-- select s.name as supermatkets, count(distinct r.supermarket_id) as sales, sum(all p.price_per_unit) as total_income from supermarkets as s
-- join receipts as r
-- on s.id = r.supermarket_id
-- join products as p
-- on r.product_id = p.id


-- 7
select concat(first_name, " ", last_name) as customer, sum(p.price_per_unit and c.balance) as original_balance from customers as c
join receipts as r
on c.id = r.customer_id
join products as p
on r.product_id = p.id
order by original_balance desc
limit 3
