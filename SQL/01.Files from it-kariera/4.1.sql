-- USE soft_uni;
-- to first task to fifth task

-- 1
-- SELECT first_name, last_name, salary 
-- FROM employees 
-- WHERE salary >= 50000

-- 2
-- SELECT first_name, last_name 
-- FROM employees
-- ORDER BY salary desc 
-- LIMIT 5

-- 3
-- SELECT employee_id AS id, first_name AS FirstName, last_name AS LastName, middle_name AS MiddleName, job_title, department_id AS DeptID, manager_id AS MngrID, hire_date AS HireDate, salary, address_id 
-- FROM employees
-- ORDER BY salary DESC, first_name ASC, last_name DESC, middle_name ASC;

-- 4
-- SELECT * FROM employees 
-- ORDER BY start_date ASC, name ASC
-- LIMIT 10

-- 5
-- SELECT first_name, last_name, hire_date FROM employees
-- ORDER BY hire_date DESC LIMIT 5

-- 6
USE geography;
-- SELECT peak_name 
-- FROM peaks 
-- ORDER BY peak_name ASC

-- 7
-- SELECT country_name, population 
-- FROM countries
-- WHERE continent_code = 'EU' 
-- ORDER BY population DESC, country_name ASC

-- 8 
SELECT country_name, country_code, 
(CASE WHEN currency_code = 'EUR' THEN 'Euro' ELSE 'Not Euro' END) AS Currency
FROM countries
ORDER BY country_name ASC

