-- use geography;
-- select  avg(elevation) as Avg_Elevation, min(elevation) as Min_Elevation, max(elevation) as Max_Elevation, count(*) as Count from peaks // Task from teacher

use soft_uni;

-- 1
-- select e.employee_id, e.first_name,
-- CASE
--  WHEN p.start_date >= '2005-01-01' THEN NULL
--  ELSE p.name
-- END as project_name from employees as e
-- left outer join employees_projects as ep
-- on e.employee_id = ep.employee_id
-- left outer join projects as p
-- on ep.employee_id = p.project_id
-- where e.employee_id = 24
 
use geography;
-- 2
-- select c1.continent_name as 'FROM', c2.continent_name as 'TO' from continents as c1
-- cross join continents c2 
-- order by c1.continent_name asc

-- 3
-- select c1.capital as Place, c1.country_name as "Player 1", "" as Host, "" as Guest, c2.country_name as "Player 2" from countries as c1
-- cross join countries as c2
-- where c1.continent_code = 'EU' and c2.continent_code = 'EU'
-- and c1.country_code <> c2.country_code
-- order by rand()

-- 4
-- select c.country_name, max(p.elevation) as highest_peak_elevation, max(r.length) as longest_river_lenght
-- from countries as c
-- left outer join mountains_countries as mc
-- on mc.country_code = c.country_code
-- left outer join mountains as m
-- on m.id = mc.mountain_id
-- left outer join peaks as p
-- on p.mountain_id = m.id
-- left outer join countries_rivers as cr
-- on cr.country_code = c.country_code
-- left outer join rivers as r
-- on r.id = cr.river_id
-- group by c.country_name
-- order by highest_peak_elevation desc, longest_river_lenght desc, c.country_name asc 
-- limit 5;

-- 5 // TODO