CREATE TABLE employee (
	EmployeeKey serial primary key,
	ParentEmployeeKey int,
	EmployeeNationalIDAlternateKey int,
	ParentEmployeeNationalIDAlternateKey VARCHAR(50),
	SalesTerritoryKey int,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	MiddleName VARCHAR(50),
	NameStyle INT,
	Title VARCHAR(50),
	HireDate DATE,
	BirthDate DATE,
	LoginID TEXT,
	EmailAddress VARCHAR(50),
	Phone TEXT,
	MaritalStatus CHAR(1),
	EmergencyContactName TEXT,
	EmergencyContactPhone TEXT,
	SalariedFlag CHAR(1),
	Gender CHAR(1),
	PayFrequency CHAR(1),
	BaseRate DECIMAL,
	VacationHours INT,
	SickLeaveHours INT,
	CurrentFlag CHAR(1),
	SalesPersonFlag CHAR(1),
	DepartmentName TEXT,
	StartDate DATE,
	EndDate DATE,
	Status TEXT
	);
	
	select * from employee
	
	
--Q2.1 -The date ranges from employee’s table where date range means employee start date and end date 
	
select  "firstname",  "startdate"::timestamp, "enddate"::timestamp, "status" from employee

--Q2.2 - Employees start date by month

select extract(month from "startdate"::timestamp) as month_sd, extract(year from "startdate"::timestamp) as year_sd , count(1) as ppl_joined FROM employee
group by  
extract (month from "startdate"::timestamp), extract(year from "startdate"::timestamp) order by  extract (year from "startdate"::timestamp), extract(month from "startdate"::timestamp);


--Q2.3 --Please find the active employees on a given date = ‘2008-07-01' (You can use operators/start and end date/NULL function)

--select "fulldatealternateKey", count(*) as current_employees
--from (select”employeekey" , "fulldatealternateKey"::timestamp, "startdate"::timestamp, "enddate"::timestamp
--from employee
--CROSS JOIN date
--where "fulldatealternateKey"::timestamp between "startdate"::timestamp
--and coalesce("enddate"::timestamp, now())) temp
--group by "fulldatealternateKey"
--order by "fulldatealternateKey"

--SELECT "FullDateAlternateKey", count(*) as currente_mployees
--FROM (SELECT”EmployeeKey" , "FullDateAlternateKey"::timestamp, "StartDate"::timestamp, "EndDate"::timestamp
--FROM employee
--CROSS JOIN date
--WHERE "FullDateAlternateKey"::timestamp BETWEEN "StartDate"::timestamp
--and coalesce("EndDate"::timestamp, now())) temp
--GROUP BY "FullDateAlternateKey"
--ORDER BY "FullDateAlternateKey"

select count(*) from employee where startdate = '2008-07-01'

--select firstname, lastname, count(*) from employee where StartDate = '2008-07-01'

--select count(status) from employee where startdate = '2008-07-01'

select employeekey, firstname, lastname from employee where startdate = '2008-07-01'

select employeekey, firstname, lastname, status from employee where startdate = '2008-07-01'

select * from employee

--Q2.5 --Check the datekey those that have an enddate. That means there is a datekey in dates table, start date and end date in the employee’s table. If you see the end date is available that means the employee is not active.

select date.datekey, employee.startdate, employee.enddate, count(1) 
from employee cross join date 
where date.datekey BETWEEN employee.startdate and employee.enddate 
group by date.datekey, employee.startdate, employee.enddate

--Q2.6 -- Add check statement for those without end-dates

select date.datekey, employee.startdate, employee.enddate, count (1) 
from employee cross join date 
where date.datekey >= employee.startdate 
and (date.datekey <= employee.enddate 
 OR 
 employee.enddate is null) 
group by date.datekey, employee.startdate, employee.endate 
order by date.datekey 
