USE [WIDGET_DEPARTMENT]
GO

select *
from employees


--get columns from EMPLOYEES TABLE
INSERT INTO [dbo].[EMPLOYEES]
           ([EMPLOYEE_ID]
           ,[EMPLOYEE_NAME]
           ,[JOB_TITLE]
           ,[MANAGER_ID]
           ,[DATE_HIRED]
           ,[SALARY]
           ,[DEPARTMENT_ID])

--insert values into WMPLYEES COLUMN
     VALUES ('90011', 
			'Kyran Stephens',
				'Salesperson', 
				'90003', 
				'2015-05-23',
				'32000',
				'4');
GO


