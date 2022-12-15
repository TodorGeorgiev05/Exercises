USE soft_uni;
-- we use soft_uni DB from 1 to 7

-- 1
-- SELECT emp.employee_id, emp.job_title, emp.address_id, adr.address_text from employees as emp
-- join addresses as adr ON
-- adr.address_id = emp.address_id
-- ORDER BY address_id asc
-- LIMIT 5;

-- 2
-- SELECT e.employee_id, e.first_name, e.last_name, d.name from employees AS e
-- JOIN departments AS d ON
-- e.department_id = d.department_id
-- WHERE d.name = 'Sales'
-- ORDER BY employee_id DESC

-- 3
-- SELECT e.employee_id, e.first_name, e.salary, d.name FROM employees AS e
-- JOIN departments AS d ON
-- e.department_id = d.department_id
-- WHERE e.salary > 15000
-- ORDER BY d.department_id desc

-- 4
-- select e.employee_id, e.first_name from employees AS e
-- WHERE e.employee_id NOT IN 
-- (
-- SELECT DISTINCT pro.employee_id FROM employees_projects AS pro
-- )
-- ORDER BY employee_id DESC
-- LIMIT 3

-- 5
-- select e.employee_id, e.first_name, m.employee_id as 'manager_id', m.first_name as 'manager_name' FROM employees AS e
-- INNER JOIN employees AS m 
-- ON m.employee_id = e.manager_id
-- WHERE e.manager_id IN (3,7)
-- ORDER BY e.first_name ASC

-- 6
-- select ls.salary, d.name from
-- (SELECT e.salary AS salary, e.department_id from employees AS e 
-- ORDER BY e.salary limit 1) as ls

-- JOIN departments as d
-- ON d.department_id = ls.department_id

-- 7
USE geography;

select country_name from countries
WHERE country_code NOT IN (SELECT DISTINCT country_code FROM mountains_countries);
