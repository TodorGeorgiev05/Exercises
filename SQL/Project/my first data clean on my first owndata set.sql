
select * from Project..SalaryReports

-- Преименуваме всички колони и махаме тази която не ни трябва
EXEC sp_rename 'SalaryReports.Години опит в ИТ индустрията', 'IT_Experience' ,'COLUMN';

EXEC sp_rename 'SalaryReports.Настояща заплата или range на заплатата (нетно, месечно, в лева)', 'Salary' ,'COLUMN';

EXEC sp_rename 'SalaryReports.Езици и технологии', 'Tech_stack' ,'COLUMN';

EXEC sp_rename 'SalaryReports.Годишни бонуси (процент или нетно в лева)', 'Bonus_payment' ,'COLUMN';

EXEC sp_rename 'SalaryReports.Компания', 'Company' ,'COLUMN';

alter table SalaryReports
drop column Бележки ;

alter table SalaryReports
drop column Timestamp ;

-- Тъй като заплатите и годините опит са въведени по различен начин и доста резултати са NULL ще ги изчистим

DELETE FROM SalaryReports 
WHERE Salary is null

DELETE FROM SalaryReports 
WHERE IT_Experience is null

DELETE FROM SalaryReports 
WHERE Bonus_payment is null

-- максимало възможна заплата
alter table salaryreports
add  Max_salary float

update salaryreports
set Max_salary = 
CASE
    WHEN Bonus_payment > 3 THEN (Salary + Bonus_payment) 
    WHEN Bonus_payment < 2.9 THEN (Salary * Bonus_payment)+ Salary
    ELSE Salary
END 
from salaryreports



