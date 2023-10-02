USE [WIDGET_DEPARTMENT]
GO
select *
from employees

--Update query to change employees department

UPDATE EMPLOYEES	
SET DEPARTMENT_ID = 1
WHERE EMPLOYEE_ID = 90011