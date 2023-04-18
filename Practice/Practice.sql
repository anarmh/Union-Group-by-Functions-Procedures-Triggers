
use Company

select * from Employees
union
select * from Customers

select * from Employees
union all
select * from Customers

select * from Employees
except
select * from Customers

select * from Employees
intersect
select * from Customers

select GETDATE()

select * from Employees
order by Age asc

select * from Employees
order by [Name] asc

select * from Employees
order by Age desc

select * from Employees where id>3
order by Age desc

select Count(*) 'Count by Age',Age from Employees where [Age]>20
group by Age


select Count(*) 'Count by Age',Age from Employees
group by Age
having Count(*)>1
order by Age desc


create view vw_GetEmployeeByAge
as
select * from Employees where Age>20

select * from vw_GetEmployeeByAge


create view vw_CustomerByAge
as
select  top 100 percent
Count(*) as 'Count',Age from Customers
group by Age


select * from vw_CustomerByAge order by Age desc

create function GetCustomersByAge()
returns int
as
begin
	declare @age int
	select @age=count(*) from Customers
	return @age
end

select dbo. GetCustomersByAge()

create function GetCustomersCountByAge(@age int)
returns int
as
begin
	declare @count int
	select @count=count(*) from Customers where Age >@age
	return @count
end

select dbo.GetCustomersCountByAge(20)

