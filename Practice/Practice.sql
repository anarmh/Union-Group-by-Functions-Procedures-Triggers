
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


create function dbo.getEmployeesAverageAgesByCondition(@id int)
returns float
as
begin
declare @sum float=cast((select Sum(Age) from Employees where id>@id)as float)
declare @count float=cast((select Count(Age)from Employees where id>@id)as float)
return @sum/@count
end

select dbo.getEmployeesAverageAgesByCondition(5)
select * from Employees



create procedure usp_InsertEmployee1
@name nvarchar(50),
@age int,
@address nvarchar(100)
as
Begin
insert into Employees([Name],[Age],[Address])
values(@name,@age,@address)
End
go

exec  usp_InsertEmployee1 'Nihad',50,'Bayil'
select * from Employees

create procedure usp_SumOfNums
@num1 int,
@num2 int
as
select @num1+@num2
exec usp_SumOfNums 5,7

create table EmployeeLogs(
[id] int primary key identity(1,1),
[EmployeeId] int,
[Operation] nvarchar(50),
[Date]datetime
)


create trigger trg_InsertEmployee on Employees
for insert
as
begin
insert into EmployeeLogs([EmployeeId],[Operation],[Date])
select Id,'Insert',GETDATE() from inserted
end


create trigger trg_DeletedEmployee on Employees
after delete
as
begin
insert into EmployeeLogs([EmployeeId],[Operation],[Date])
select Id,'Delete',GETDATE() from deleted
end

select * from EmployeeLogs
select * from Employees
delete from Employees where id=7