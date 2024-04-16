drop database if exists QuanLyHocVien;
create database if not exists QuanLyHocVien;

use QuanLyHocVien;

create table Class(
IDClass int primary key not null,
ClassName nvarchar(20) not null,
Language nvarchar(20) not null,
Descriptions text);
 insert into Class(IDClass, ClassName, Language) value (102, 'front_end', 'java'),(103, 'back_end', 'java'),
 (104, 'full stack', 'java'), (105, 'Ung dung mobi', 'java'), (106, 'Do hoa game', 'C++');
 
 create table Address(
 ID int primary key not null,
 Address nvarchar(50));
 insert into Address (ID, Address) value ( 92, 'Quang Nam'),(29, 'Ha Noi'), (98, 'Bac Giang'), (99, 'Bac Ninh'), ( 90, 'Ha Nam');
 
 create table Students(
 ID int auto_increment primary key not null,
 FullName nvarchar(100) not null,
 Address_ID int not null,
 Age int not null,
 ClassID int not null);
 insert into Students(  FullName, Address_ID, Age, ClassID) value ('Nguyen Thanh An', 92, 25,104), ('Ngo Huu Nhat', 92, 24, 102),
 ('Pham Quang Toan', 92, 26, 105), ('Ho Tan Tung', 92, 20, 106), ('Pham Quang Tien',92,21, 103), ('Tran Van B',29, 19, 106),
 ('Pham C', 98, 30, 104), ('Nguyen D', 99, 23, 102), ('Luong Son Bac', 90, 17, 106), ('Monkey_D_Luffy',98, 19, 105);
 
 create table Course(
 ID int auto_increment primary key not null,
 CourseName varchar(100) not null,
 Descriptions text);
 drop table Course;
 insert into Course( CourseName) value ('Fundamentals of Programming'), ('Introduction to Web Development'), ('Object-Oriented Programming'),
 ('Responsive Web Design with Bootstrap'), ('Building Modern Web Applications'), ('Data Structures and Algorithms'),
 ('Game Development Fundamentals'), ('Mobile App Development'), ('Full-Stack Web Development'), ('Data Science'), ('Building RESTful APIs with Django Rest Framework'),
 ('iOS App Development'), ('Android App Development'), ('Data Analysis and Visualization'), ('Blockchain Development Fundamentals'),
 ('Cloud Computing with AWS: From Beginner to Advanced'), ('Cybersecurity Essentials for Programmers'), ('UI/UX Design Principles for Developers'),
 ('Machine Learning and AI for Beginners'), ('Ethical Hacking and Penetration Testing');
 
 create table Point(
 ID int auto_increment primary key not null,
 Course_ID int not null,
 Student_ID int not null,
 Points int not null);
 insert into Point(Course_ID, Student_ID, Points) value (1,1,9), (12,1,8), (2,2,7), (3,2,6), (3,3,7), (13,3,9), (10,4,8), (4,4,8), (5,5,5),
 (15,5,8), (20,6,7),(17,6,8),(9,7,9), (17,7,4), (8,8,8), (11,8,7), (12,9,7), (1,9,6), (19,10,9), (18,10,5);
 
 select * from Students where FullName like 'Nguyen%';
select * from Students where FullName like '%An';
select * from Students where Age between 20 and 25;
select * from Students where ID=10 or ID = 12;

ALTER TABLE Students
ADD INDEX idx_Class_ID (ClassID);

alter table Class add constraint fk_Class_ID foreign key (IDClass) references Students (ClassID);
alter table Students add constraint fk_Address_ID foreign key (Address_ID) references Address (ID);

select C.ClassName, count(C.ClassName) as SoLuongHocVien from Class C
left join Students S on C.IDClass = S.ClassID
group by C.ClassName;

select A.Address, count(A.Address) as SoLuongHocVien from Address A
left join Students S on A.ID = S.Address_ID
group by A.Address;

select avg(Points) as DiemTrungBinh from Point;
select min(Points) as DiemThapNhat from Point;
select max(Points) as DiemCaoNhat from Point;
select ucase(FullName) from Students;





