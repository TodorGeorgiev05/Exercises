USE soft_uni;
-- we use soft_uni for 1 and 2 

-- 1

-- (SELECT first_name, last_name, "(no manager)" as manager_name
-- FROM employees  where manager_id IS NULL)

-- UNION

-- (SELECT first_name, last_name,
-- (SELECT CONCAT(first_name," ", last_name)
-- FROM employees 
-- WHERE employee_id = e.manager_id)
-- FROM employees e WHERE manager_id IS NOT NULL)
-- ORDER BY manager_name ASC

-- 2
-- (SELECT first_name, last_name, "manager" as position, salary
-- FROM employees  where employee_id IN 
-- (
-- SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL
-- )
-- ORDER BY salary DESC LIMIT 5)

-- UNION

-- (SELECT first_name, last_name, "employee", salary
-- FROM employees  
-- where employee_id NOT IN 
-- (
-- SELECT DISTINCT manager_id 
-- FROM employees 
-- WHERE manager_id IS NOT NULL
-- )
-- ORDER BY salary DESC LIMIT 3)

-- 3
use geography;

-- (SELECT mountain_range,  
-- (SELECT peak_name FROM peaks WHERE mountain_id = m.id ORDER by peak_name DESC LIMIT 1) peak_name,
-- (SELECT elevation FROM peaks WHERE mountain_id = m.id ORDER by peak_name DESC LIMIT 1) elevation
-- from mountains m  

-- WHERE id IN (SELECT mountain_id FROM mountains_countries WHERE country_code = 'BG')
-- AND id IN (SELECT DISTINCT mountain_id FROM peaks))

-- 4

-- (SELECT p.peak_name as name, "peak" as type, p.elevation as info from peaks as p
-- where mountain_id IN (
-- select mountain_id from mountains_countries where country_code = 'BG'))

-- UNION 

-- (SELECT r.river_name, 'river', r.length from rivers as r
-- where id in (
-- select river_id from countries_rivers where country_code = 'BG')) 

-- UNION 

-- (SELECT m.mountain_range, 'mountain',
-- (SELECT elevation FROM peaks WHERE mountain_id = m.id ORDER by elevation DESC LIMIT 1) elevation 
-- from mountains as m
-- where id in (
-- select mountain_id from mountains_countries where country_code = 'BG')) 

-- ORDER BY name ASC

