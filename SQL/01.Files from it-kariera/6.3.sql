use gringotts;

-- 1
-- select deposit_group, (select sum(deposit_amount))as total_sum from wizzard_deposits
-- where magic_wand_creator = 'Ollivander family'
-- group by deposit_group
-- order by deposit_group asc

-- 2
-- select deposit_group, (select sum(deposit_amount))as total_sum from wizzard_deposits
-- where magic_wand_creator = 'Ollivander family'
-- group by deposit_group
-- having total_sum < 150000
-- order by deposit_group desc