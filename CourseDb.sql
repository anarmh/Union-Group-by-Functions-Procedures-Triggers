create database CourseDb

use CourseDb
create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(50) not null,
[Age] int,
[Email] nvarchar(100) unique,
[Address] nvarchar(100)
)


insert into Students([Name],[Surname],[Age],[Email],[Address])
values('Anar','Huseynov',36,'anarmh@code.edu.az','Sumqayit'),
('Ceyhun','Piriyev',28,'ceyhun@code.edu.az','Sahil'),
('Cavid','Rzayev',29,'cavid@code.edu.az','Suraxani'),
('Tebriz','Quliyev',25,'tebriz@gmail.com','20 yanvar'),
('Turqut','Memmedov',30,'turqut@code.edu.az','2-ci mkr')


create table StudentArchives(
[Id] int primary key identity(1,1),
[StuId] int,
[StuName] nvarchar(50),
[StuSurname] nvarchar(50),
[StuAge] int,
[StuEmail] nvarchar(100),
[StuAddress] nvarchar(100),
[Operation] nvarchar(50),
[Date] datetime
)


create trigger trg_DeleteStudent on Students
after delete 
as
begin
insert into StudentArchives([StuId],[StuName],[StuSurname],[StuAge],[StuEmail],[StuAddress],[Operation],[Date])
select Id,Name,Surname,Age,Email,Address,'Deleted',GETDATE() from deleted
end

delete from Students where id=5
select * from Students
select * from StudentArchives

create procedure usp_DeleteStudent( @id int)
as
begin
delete from Students where id=@id
end

EXEC usp_DeleteStudent @id = 3


