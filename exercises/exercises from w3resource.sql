USE soft_uni;

-- exercises are from -> https://www.w3resource.com/mysql-exercises/restricting-and-sorting-data-exercises and i'm using a soft_uni_database

-- select first_name, last_name, hire_date
-- from employees 
-- where hire_date 
-- like '2000%';

-- select first_name
-- from employees 
-- where first_name like '%b%' 
-- and first_name like '%c%';

-- select last_name, job_title, salary 
-- from employees 
-- where salary NOT IN(9000, 9500, 10000) 
-- and job_title in ('Production Technician') order by salary asc

-- select last_name
-- from employees
-- where last_name like '_____';

-- select last_name
-- from employees
-- where last_name like '__e%';

-- select first_name, last_name, salary, salary*.15 PF
-- from employees

-- select * from employees where last_name IN ('JONES', 'BLAKE', 'SCOTT', 'KING', 'FORD');

-- https://solutioncenter.apexsql.com/how-to-export-import-mysql-data-to-excel/
-- INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2actor.txt' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'    

-- https://www.w3resource.com/mysql-exercises/aggregate-function-exercises/

-- select sum(salary) from employees

-- select min(salary) from employees

-- select max(salary) from employees
-- where job_title = 'buyer'

-- select avg(salary) from employees
-- where job_title = 'Purchasing Manager'

-- select avg(salary), min(salary), max(salary) from employees

-- TODO: from 7 and to research for subqueries and to do https://www.w3resource.com/sql-exercises/sql-subqueries-exercises.php


