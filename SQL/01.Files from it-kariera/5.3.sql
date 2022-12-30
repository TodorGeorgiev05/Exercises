use geography;

-- 1
-- select  c.country_name, r.river_name from countries as c
-- left join countries_rivers as cr
-- on cr.country_code = c.country_code
-- left join rivers as r
-- on r.id = cr.river_id
-- where continent_code = 'AF' 
-- order by country_name asc

-- 2
-- select country_name from countries as c
-- left outer join mountains_countries as mc
-- on c.country_code = mc.country_code	 
-- where mc.mountain_id IS NULL;

-- 3
-- select m.mountain_range, p.peak_name, p.elevation from mountains as m
-- left outer join peaks as p
-- on p.mountain_id = m.id 
-- and p.id = (select id from peaks where mountain_id = m.id order by elevation DESC LIMIT 1 )
-- left outer join mountains_countries as mc
-- on mc.mountain_id = m.id
-- left outer join countries as c
-- on c.country_code = mc.country_code
-- where c.country_code = 'BG'
-- order by elevation desc

-- use soft_uni;
-- 4
-- select e.employee_id, e.first_name, e.last_name from employees as e
-- left outer join employees_projects as ep
-- on e.employee_id = ep.employee_id
-- where ep.project_id is null
-- order by first_name, last_name asc
-- limit 3
