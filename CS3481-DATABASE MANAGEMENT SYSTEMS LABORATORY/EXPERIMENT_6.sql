/*
Write user defined functions and stored procedures in SQL.
*/

create schema EXPERIMENT_6;

-- Try Execution 2ND time This Code First 
-- drop schema EXPERIMENT_6

use EXPERIMENT_6;

create table Student_Marks(
Student_Id int,
Name varchar(50),
Tamil int,
Physics int,
Chemistory int,
English int,
Biology int,
Maths int
);

insert into Student_Marks values(1001,'Shreya',55,45,56,87,21,65);
insert into Student_Marks values(1002,'Suresh',75,96,78,64,90,82);
insert into Student_Marks values(1003,'Ramesh',25,54,89,76,95,74);

select * from Student_Marks;
