CREATE TABLE date(
    DateKey DATE,
    FullDateAlternateKey DATE,
    DayNumberOfWeek INT,
    EnglishDayNameOfWeek VARCHAR(50),
	SpanishDayNameOfWeek VARCHAR(50),
	FrenchDayNameOfWeek VARCHAR(50),
	DayNumberOfMonth INT,
	DayNumberOfYear INT,
	WeekNumberOfYear INT,
	EnglishMonthName VARCHAR(50),
	SpanishMonthName VARCHAR(50),
	FrenchMonthName VARCHAR(50),
	MonthNumberOfYear INT,
	CalenderQuarter INT,
	CalenderYear INT,
	CalenderSemester INT,
	FiscalQuarter INT,
	FiscalYear INT,
	FiscalSemester INT
	);
	
	select * from date
	
	
	
	--Q2.4 -Check maximum and min dates

select min("datekey"), max("datekey")
from date