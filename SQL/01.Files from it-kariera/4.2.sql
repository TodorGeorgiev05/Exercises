USE soft_uni;

-- 1
-- SELECT first_name, last_name, salary 
-- FROM employees 
-- WHERE salary =
-- (SELECT salary FROM employees ORDER BY salary LIMIT 1)

-- 2
-- select first_name, last_name, salary
-- from employees
-- WHERE salary < 1.1 *
-- (
-- select salary from employees ORDER BY salary LIMIT 1
-- )
-- ORDER BY salary LIMIT 35;

-- 3
-- SELECT first_name, last_name, job_title 
-- FROM employees 
-- WHERE employee_id IN
-- (
-- SELECT DISTINCT manager_id FROM employees
-- )
-- ORDER BY first_name ASC, last_name ASC


-- 4
SELECT first_name, last_name 
FROM employees 
WHERE address_id IN 
(
   SELECT address_id FROM addresses
   WHERE town_id = 
   (
	SELECT town_id 
    FROM towns WHERE name = 'San Francisco'
   )
)
ORDER BY first_name ASC, last_name ASC;

