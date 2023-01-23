-- QUERIES FOR TABLEAU

select tech_stack, salary, max_salary from Project..SalaryReports
where Tech_stack like '%Python%'

select tech_stack, salary, max_salary from Project..SalaryReports
where Tech_stack like '%C#%'

select tech_stack, salary, max_salary from Project..SalaryReports
where Tech_stack like '%Java%'


-- average salary where it exp is equal or above 1.5years

select AVG(salary)AS AverageSalary_overYear_Half_EXP from Project..SalaryReports 
where IT_Experience > 1.49

-- average salary
select AVG(salary)AS AverageSalary from Project..SalaryReports 