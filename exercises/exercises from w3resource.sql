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

-- select first_name, last_name, salary
-- from employees 
-- where salary > 
-- ( select salary 
-- from employees 
-- where employee_id = 2);

-- select * from employees 
-- where department_id = 
-- (select department_id
-- from departments	
-- where department_id = 3)

-- SELECT first_name, last_name, salary, department_id  
-- FROM employees  
-- WHERE salary IN  
-- ( SELECT MIN(salary)  
-- FROM employees  
-- GROUP BY department_id 
-- );

-- select first_name, last_name, employee_id, salary
-- from employees
-- where salary >
-- (select AVG(salary) 
-- from employees)

-- SELECT first_name, last_name, employee_id, salary 
-- FROM employees  
-- WHERE department_id = 
-- (SELECT department_id  
-- FROM departments  
-- WHERE name = 'Tool Design' 
-- );

-- SELECT e.department_id, first_name, job_title, d.name
-- FROM employees e, departments d
-- WHERE e.department_id = d.department_id
-- AND  d.name = 'Finance';

-- select * from employees where employee_id IN(134,159,183)

-- select * from employees where salary between 9000 and 15000

-- select * from employees where salary between 
-- (select min(salary))and 12000

-- select * from employees 
-- where department_id not in
-- (select department_id 
-- from departments 
-- where manager_id between 100 and 200)

-- select * from employees where salary in
-- (select max(salary) from employees
-- https://www.w3resource.com/sql-exercises/sql-subqueries-exercise-12.php да питам господина да обясни точно как работи кода

-- select first_name, last_name, hire_date, department_id from employees where department_id =
-- (select department_id from employees where first_name = 'Alex')

-- select first_name, last_name, hire_date, department_id from employees where department_id in
-- (select department_id from employees where first_name  like 'A%')

-- select first_name, last_name, department_id, salary from employees where department_id in
-- (select department_id from employees where first_name  like 'A%') and salary >
-- (select avg(salary) from employees)
-- TODO: from 15. problem and to research for subqueries and to do https://www.w3resource.com/sql-exercises/sql-subqueries-exercises.php

