# WidgetLtd
Widget Ltd sells widgets to end users via a field based sales team. The record keeping for the company is a manual filing system which now needs to be modernised. For the MVP, the manual files need to be stored in database tables and there is a requirement to produce a number of reports based around Departments

I have created a SQL server that contains the database WIDGET_DEPARTMENT. This Database contains two tables DEPARTMENT_NAME and EMPLOYEES.
  DEPARTMENT_NAME contains the details of the different departments, i decided to use a identity specification on the DEPARTMENT_ID, this makes it so whenever a new department is created it will have a unique identifier as a Department ID, this column is also used ass the primary key so duplicates cannot be created.
  EMPLOYEES contains all the relevant data for any employees working at Widget LTD. this ranges from Employee Id, Employee Name, Job Title etc. Since the Employee ID column started at 90001 i did not make this a identity specificaiton, i thought starting one from the number 90001 would make it difficult if Widget LTD decided to ever use smaller numbers.

In this project you will also, find the main datbase and the types it used but also the scripts and queries. I was unsure on how to do some of the tasks so ihave created queries and scripts to allow it to work.

With one of the questions being add a employee I decided to add myself to the table as a test.

With the build and run of this i belive you should be able to move the database into SSMS and it should open. I will upload screenshots and other evidence incase i did not upload or create it correctly. It is my first time using GitHub so I apologise if this is a mess and my first time trying to send a database on here so again im sorry for what a mess this might be.

Thank you for taking the time to read this.
