create database Course
use Course

create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(100) not null
)

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(100) not null,
[CountryId]int foreign key references Countries(Id)
)

create table Students(
[Id] int primary key identity(1,1),
[FullName] nvarchar(50) not null,
[Email] nvarchar(50) unique,
[Age] int,
[Address] nvarchar(100) not null,
[Phone] nvarchar(50) not null,
[CityId] int foreign key references Cities(Id)
)

create table Teachers(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(50) not null,
[Age] int check(Age>25),
[Salary] decimal,
[Phone] nvarchar(50) not null,
[CityId]int foreign key references Cities(Id)
)

create table StaffMembers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(50) not null,
[Address] nvarchar(100) unique,
[Email] nvarchar(100) unique,
[CityId] int foreign key references Cities(Id)
)

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null
)

create table StaffMemeberRoles(
[Id] int primary key identity(1,1),
[StaffMemberId] int foreign key references StaffMembers(Id),
[RoleId]int foreign key  references Roles(Id)
)

create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Capacity] int
)

create table Educations(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null
)

create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Capacity] int,
[RoomId] int foreign key references Rooms(Id),
[EducationId] int foreign key references Educations(Id)
)


create table StudentGroups(
[Id] int primary key identity(1,1),
[StudentId] int foreign key references Students(Id),
[Groups] int foreign key references Groups(Id)
)

create table TeacherGroups(
[Id] int primary key identity(1,1),
[TeacherId] int foreign key references Teachers(Id),
[GroupId] int foreign key references Groups(Id)
)

create table WeekDays(
[Id] int primary key identity(1,1),
[Day] nvarchar(50) not null
)


create table Seanses(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null
)

create  table WeekDaySeans(
[Id] int primary key identity(1,1),
[WeekDayId] int foreign key references WeekDays(Id),
[SeansId] int foreign key references Seanses(Id)
)

create table GroupWeekDaySeanses(
[id] int primary key identity(1,1),
[GroupId] int foreign key references Groups(Id),
[WeekDaySeansId] int foreign key references WeekDaySeans(Id)
)