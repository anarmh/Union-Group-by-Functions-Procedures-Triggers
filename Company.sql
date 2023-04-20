create database Company

use Company

create table Employees(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(50) not null,
[Age] int check(Age>20),
[Salary] decimal,
[Position] nvarchar(100),
[IsDeleted] bit ,
[CityId] int foreign key references Cities(Id)
)
select* from Employees

insert into Employees([Name],[Surname],[Age],[Salary],[Position],[IsDeleted],[CityId])
values('Anar','Huseynov',36,800,'Avadanliq temir uzre mutexessis',0,2),
('Anar','Huseynov',36,800,'Mutexessis',0,2),
('Ceyhun','Piriyev',28,1000,'Aparici mutexessis',0,1),
('John','Nelson',41,5500,'PHP Developer',1,6),
('Elnare','Qasimova',25,1200,'Reseption',0,4),
('Gulay','Quliyeva',24,1800,'Reseption',1,5),
('Rustem','Veliyev',45,1100,'NetworkAdmin',0,8)

update  Employees
set Name='Elxan', Surname='Memmedov',Age=39,Salary=2500,Position='Full-Stack-Developer',Isdeleted=1,Cityid=3  where id=1
create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
)

insert into Countries ([Name])
values('Azerbaycan'),
('Turkiye'),
('Almaniya'),
('Amerika'),
('Gurcustan')



create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[CountryId] int foreign key references Countries(Id)
)

insert into Cities([Name],[CountryId])
values('Baki',1),
('Sumqayit',1),
('Istanbul',2),
('Ankara',2),
('Berlin',3),
('New York',4),
('Texas',4),
('Tiflis',5)

select * from Countries
select * from Cities
select * from Employees

select e.Name,e.Surname as'Surname', ct.Name as'City',co.Name as 'Country' from Employees e
 inner join Cities ct
 on e.CityId=ct.id
  inner join Countries co
 on ct.CountryId=co.id


 
select e.Name,e.Surname as'Surname',e.Salary as 'Salary',ct.Name as'City',co.Name as 'Country' from Employees e
 inner join Cities ct
 on e.CityId=ct.id
  inner join Countries co
 on ct.CountryId=co.id
  where e.Salary>2000

  select ct.Name as'City',co.Name as 'Country' from Cities ct
  inner join Countries co
 on ct.CountryId=co.id


 select e.Name,e.Surname as'Surname',e.Age as 'Age',e.Salary as 'Salary',e.Position as 'Positon',ct.Name as'City',co.Name as 'Country' from Employees e
 inner join Cities ct
 on e.CityId=ct.id
  inner join Countries co
 on ct.CountryId=co.id
 where e.Position='Reseption'

 
 select e.Name,e.Surname as'Surname',e.Age as 'Age',e.Salary as 'Salary',e.Position as 'Positon',e.IsDeleted as 'IsDeleted',ct.Name as'City',co.Name as 'Country' from Employees e
 inner join Cities ct
 on e.CityId=ct.id
  inner join Countries co
 on ct.CountryId=co.id
 where e.IsDeleted='true'
 