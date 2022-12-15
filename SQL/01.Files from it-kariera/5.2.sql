USE soft_uni;

-- 1
-- SELECT e.first_name, e.last_name, t.name AS towns, a.address_text from employees as e
-- JOIN addresses as a
-- ON e.address_id = a.address_id
-- JOIN towns as t
-- ON a.town_id = t.town_id

-- ORDER BY first_name ASC, last_name ASC

-- 2
-- select e.first_name, e.last_name, e.hire_date, d.name AS dept_name from employees AS e
-- INNER JOIN departments AS d 
-- ON (e.department_id = d.department_id
-- AND date(hire_date) > '1999-01-01'
-- AND d.name IN ("Finance", "Sales") )
-- ORDER BY hire_date ASC

-- 3
-- select e.employee_id, e.first_name, p.name from employees as e

-- INNER JOIN employees_projects as ep
-- ON(ep.employee_id = e.employee_id)
-- INNER JOIN projects as p
-- ON (p.project_id = ep.project_id)
-- WHERE DATE(p.start_date) > '2002-08-13'
-- ORDER BY first_name ASC, p.name ASC
-- LIMIT 5

-- 4
-- select e.employee_id, 
-- concat(e.first_name, " ", e.last_name) AS employee_name, 
-- concat(m.first_name, ' ', m.last_name) AS manager_name,
-- d.name as department_name FROM employees AS e
-- INNER JOIN employees AS m 
-- ON m.employee_id = e.manager_id
-- INNER JOIN departments as d
-- ON d.department_id = e.department_id
-- ORDER BY e.employee_id ASC

USE geography;

-- 5
-- select c.country_code, m.mountain_range, p.peak_name ,p.elevation from countries as c
-- INNER JOIN mountains_countries as mc
-- ON mc.country_code = c.country_code
-- INNER JOIN mountains as m
-- ON m.id = mc.mountain_id
-- INNER JOIN peaks as p
-- ON m.id = p.mountain_id
-- WHERE mc.country_code = 'BG'
-- ORDER BY elevation DESC

-- 6
-- select c.country_code, c.country_name, m.mountain_range from countries as c
-- INNER JOIN mountains_countries as mc
-- ON mc.country_code = c.country_code
-- INNER JOIN mountains as m
-- ON mc.mountain_id = m.id
-- WHERE c.country_code IN ('US','RU','BG')
-- ORDER BY c.country_code ASC, m.mountain_range ASC




