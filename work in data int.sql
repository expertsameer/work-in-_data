CREATE TABLE employe (
empno INT PRIMARY KEY,
ename VARCHAR(10),
job VARCHAR(9),
mgr INT NULL,
hiredate DATETIME,
sal NUMERIC(7,2),
comm NUMERIC(7,2) NULL,
dept INT)

insert into employe values
    (1,'JOHNSON','ADMIN',6,'12-17-1990',18000,NULL,4)
insert into employe values
    (2,'HARDING','MANAGER',9,'02-02-1998',52000,300,3)
insert into employe values
    (3,'TAFT','SALES I',2,'01-02-1996',25000,500,3)
insert into employe values
    (4,'HOOVER','SALES I',2,'04-02-1990',27000,NULL,3)
insert into employe values
    (5,'LINCOLN','TECH',6,'06-23-1994',22500,1400,4)
insert into employe values
    (6,'GARFIELD','MANAGER',9,'05-01-1993',54000,NULL,4)
insert into employe values
    (7,'POLK','TECH',6,'09-22-1997',25000,NULL,4)
insert into employe values
    (8,'GRANT','ENGINEER',10,'03-30-1997',32000,NULL,2)
insert into employe values
    (9,'JACKSON','CEO',NULL,'01-01-1990',75000,NULL,4)
insert into employe values
    (10,'FILLMORE','MANAGER',9,'08-09-1994',56000,NULL,2)
insert into employe values
    (11,'ADAMS','ENGINEER',10,'03-15-1996',34000,NULL,2)
insert into employe values
    (12,'WASHINGTON','ADMIN',6,'04-16-1998',18000,NULL,4)
insert into employe values
    (13,'MONROE','ENGINEER',10,'12-03-2000',30000,NULL,2)
insert into employe values
    (14,'ROOSEVELT','CPA',9,'10-12-1995',35000,NULL,1)
insert into employe values
    (15,'Pakistan','Admin',9,'10-12-1996',37000,NULL,2)
insert into employe values
    (16,'America','IT',10,'11-12-1996',38000,NULL,23)
insert into employe values
    (17,'USA','Engineer',10,'11-12-1997',40000,NULL,24)
insert into employe values
    (18,'USA','Engineer',11,'11-12-1997',40000,NULL,25)
insert into employe values
    (19,'Austalia','Engineer',11,'11-12-1997',40000,NULL,25)
insert into employe values
    (20,'Austalia','Engineer',11,'11-12-1997',40000,NULL,25)

CREATE TABLE dept (
deptno INT NOT NULL,
dname VARCHAR(14),
loc VARCHAR(13))
insert into dept values (1,'ACCOUNTING','ST LOUIS')
insert into dept values (2,'RESEARCH','NEW YORK')
insert into dept values (3,'SALES','ATLANTA')
insert into dept values (4, 'OPERATIONS','SEATTLE')

Select * from employe 
Select * from dept

create trigger tremploye_forinsert
on employe
after insert 
as 
begin
select * from inserted
end


create table employe_Audit
(Audit_Id int primary key identity, Audit_info varchar(max));
Select * from employe_Audit;


alter trigger employe_Audit_forinsert
on employe_Audit
after insert
as 
begin
   Declare @id int
   Select @id= id from inserted

insert into employe_Audit Values('student with id' + cast(@Id as varchar(50)) + 'is added at' + cast(GETDATE() as varchar (50)));
end

create view Vw_employe1
as
Select A.empno,A.ename,A.job,B.* from employe as A
inner join dept as B
ON B.deptno=A.empno


create view Vw_employe2
as
Select A.empno,A.ename,A.job,B.* from employe as A
inner join dept as B
ON B.deptno=A.empno
where dname='ACCOUNTING'
