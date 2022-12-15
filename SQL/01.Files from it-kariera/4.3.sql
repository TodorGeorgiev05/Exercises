-- 1
-- use soft_uni;

-- select e.job_title, e.salary from employees e
-- where e.salary =
-- (select em.salary from employees em
-- where  e.job_title = em.job_title
-- order by em.salary asc limit 1) 
-- order by salary desc,
-- job_title asc

-- 2
-- SELECT e.first_name, e.last_name, e.salary,
-- (SELECT d.name from departments d 
-- WHERE d.department_id = e.department_id) as department
-- FROM employees e 
-- WHERE e.salary = 
-- (SELECT em.salary FROM employees em
-- WHERE e.department_id = em.department_id
-- ORDER BY em.salary ASC LIMIT 1)
-- ORDER BY e.salary, e.first_name, e.last_name


-- 3
-- select m.first_name, m.last_name from employees as m
-- where (m.employee_id, m.middle_name) in
--  (select manager_id , middle_name from employees)
--  order by first_name asc

-- 4
-- select m.first_name, m.last_name from employees as m
--  
-- WHERE m.employee_id IN (SELECT manager_id FROM employees)
-- AND m.salary < ANY (SELECT salary FROM employees WHERE manager_id = m.employee_id)

-- 5
-- ne reshena

-- 6
-- use geography;

-- SELECT m.mountain_range, 
-- (select peak_name from peaks as p where m.id = p.mountain_id order by elevation desc limit 1) as peak_name,
-- (select elevation from peaks as p where m.id = p.mountain_id order by elevation desc limit 1)as elevation 
-- from mountains as m
-- WHERE id IN (SELECT mountain_id FROM mountains_countries WHERE country_code = 'BG')
--  ORDER BY elevation desc

-- 7
-- select mountain_range from mountains as m
-- where id in
-- (select mountain_id from mountains_countries where country_code = 'BG') 
-- AND NOT EXISTS (select peak_name from peaks as p where m.id = p.mountain_id)