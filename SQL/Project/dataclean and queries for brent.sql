select * from Project..brent

ALTER TABLE brent
ALTER COLUMN Date date;

EXEC sp_rename 'brent.Europe Brent Spot Price FOB (Dollars per Barrel)', 'Price' ;

select AVG(price) as AvgPrice_to_2000 from brent 
where date < '2000-01-01'

select AVG(price) as AvgPrice_after_2000 from brent 
where date > '2000-01-01'

select AVG(price) as AvgPrice from brent


