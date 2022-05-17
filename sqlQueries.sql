drop database if exists gl_exams_backend_crm;
create database gl_exams_backend_crm;
use gl_exams_backend_crm;

drop table if exists customers;
create table books(
Id int primary key auto_increment,
FirstName varchar(255),
LastName varchar(255),
Email varchar(255)
);


truncate table customers;

insert into customers(FirstName,LastName,Email) values("Harshit","Choudhary","harshit@greatlearning.in");