
select * from Project..SalaryReports

-- ������������ ������ ������ � ������ ���� ����� �� �� ������
EXEC sp_rename 'SalaryReports.������ ���� � �� �����������', 'IT_Experience' ,'COLUMN';

EXEC sp_rename 'SalaryReports.�������� ������� ��� range �� ��������� (�����, �������, � ����)', 'Salary' ,'COLUMN';

EXEC sp_rename 'SalaryReports.����� � ����������', 'Tech_stack' ,'COLUMN';

EXEC sp_rename 'SalaryReports.������� ������ (������� ��� ����� � ����)', 'Bonus_payment' ,'COLUMN';

EXEC sp_rename 'SalaryReports.��������', 'Company' ,'COLUMN';

alter table SalaryReports
drop column ������� ;

alter table SalaryReports
drop column Timestamp ;

-- ��� ���� ��������� � �������� ���� �� �������� �� �������� ����� � ����� ��������� �� NULL �� �� ��������

DELETE FROM SalaryReports 
WHERE Salary is null

DELETE FROM SalaryReports 
WHERE IT_Experience is null

DELETE FROM SalaryReports 
WHERE Bonus_payment is null

-- ��������� �������� �������
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



