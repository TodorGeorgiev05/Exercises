use gringotts;
-- 1
-- select deposit_group, MAX(magic_wand_size) as longest_magic_wand from wizzard_deposits
-- group by deposit_group
-- order by longest_magic_wand, deposit_group 

-- 2
-- SELECT deposit_group FROM wizzard_deposits
-- GROUP BY deposit_group
-- HAVING AVG(magic_wand_size) <
-- (
--     SELECT AVG(magic_wand_size) FROM wizzard_deposits
-- )
-- limit 1

-- 3
select deposit_group, (select sum(deposit_amount))as total_sum from wizzard_deposits
group by deposit_group
order by total_sum asc



