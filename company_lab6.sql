create database company_lab5;
use company_lab5;




create table EMPLOYEE (
	Fname varchar(40) not null,
	Minit varchar(40),
	Lname varchar(40) not null,
	Ssn int,
	Bdate date,
	Address varchar(100),
	Sex varchar(1),
	Salary int,
	Super_ssn int,
	Dno int,
	primary key (Ssn)
);

create table DEPARTMENT (
	Dname varchar(40),
	Dnumber int,
	Mgr_ssn int,
	Mgr_start_date date,
	primary key (Dnumber),
	foreign key (Mgr_ssn) references employee(Ssn)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);


/* back to employee table to make Dno and Super_ssn as foreign keys */

ALTER TABLE employee
ADD FOREIGN KEY(Dno)
REFERENCES DEPARTMENT(Dnumber);


ALTER TABLE employee
ADD FOREIGN KEY(Super_ssn)
REFERENCES employee(Ssn);


/* create all another tables */

create table DEPT_LOCATIONS(
	Dnumber int,
	Dlocation varchar(100),
	primary key (Dnumber,Dlocation),
	foreign key (Dnumber) references DEPARTMENT(Dnumber)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);


CREATE TABLE PROJECT(
	Pname VARCHAR(15) NOT NULL,
  	Pnumber INT NOT NULL,
  	Plocation VARCHAR(15),
  	Dnum  INT ,
	PRIMARY KEY (Pnumber),
	FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
		ON DELETE SET NULL 
		ON UPDATE CASCADE
);

CREATE TABLE WORKS_ON (
	Essn  int  ,
	Pno   int  ,
	Hours  int ,
	PRIMARY KEY (Essn, Pno),
	FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)
);

CREATE TABLE DEPENDENT ( 
	Essn int,
	Dependent_name VARCHAR(15) NOT NULL,
	SEX CHAR,   
	Bdate DATE,     
	Relationship VARCHAR(8),
	PRIMARY KEY (Essn,dependent_name),
	FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);


/* insertion into tables */
insert into employee values('mohamed', 'm', 'fahmy',1 ,'1989-09-19', '10 adan street', 'M',10000, Null, Null);
insert into employee values('AYA', 'm', 'Mohamed',2 ,'1987-07-22', '21 shihab street', 'F',2000, Null, Null);
insert into employee values('ALAA', 'F', 'fahmy',3 ,'1989-09-19', 'street 7 EL maadi', 'F',5000, Null, Null);
insert into employee values('Wafaa', 'K', 'Kahky',4 ,'1989-09-19', '10 adan street', 'M',2000, Null, Null);
insert into employee values('Samir', 'K', 'khaled',5 ,'1989-09-19', '10 Helioplis', 'M',2000, Null, Null);


insert into DEPARTMENT values('Business', 1, 1, '2001-01-01');
insert into DEPARTMENT values('testing', 2, 3, '2005-01-01');
insert into DEPARTMENT values('development', 3, 2, '2006-01-01');



/* back to employee to update values of Dno */

UPDATE employee
SET Dno = 1
WHERE Ssn= 1;

UPDATE employee
SET Dno = 1
WHERE Ssn= 2;

UPDATE employee
SET Dno = 2
WHERE Ssn= 3;

UPDATE employee
SET Dno = 2
WHERE Ssn= 4;



/* back to employee to update values of Dno */
UPDATE employee
SET	Super_ssn = 1
WHERE Ssn= 2;

UPDATE employee
SET Super_ssn = 1
WHERE Ssn= 3;

UPDATE employee
SET Super_ssn = 2
WHERE Ssn= 4;




/*insertion of remaining data to another tables*/

/* dept_locations table */
insert into dept_locations 
Values (1,'First floor');

insert into dept_locations 
Values (2,'2nd floor');


insert into dept_locations 
Values (3,'3rd floor');



/* project table */
insert into Project 
Values ('Hotel system',125 ,'Mariot',1);

insert into Project 
Values ('Library website',112 ,'alfa',3);

insert into Project 
Values ('e-commerce',221 ,'puma',2);

insert into Project 
Values ('restaurant',122 ,'Mariot',2);


/* works_on */
insert into works_on 
Values (1,221 ,4);

insert into works_on 
Values (2,125 ,6 );

insert into works_on 
Values (3,221 ,6 );

insert into works_on 
Values (4,112 ,8 );



/* Dependent */
insert into dependent 
Values (1,'Hussam','M','1989-06-22','Brother');


insert into dependent 
Values (1,'Ayman','M','1977-05-22','Brother');


insert into dependent 
Values (3,'Amany','F','2003-03-23','Daughter');


insert into dependent 
Values (4,'Ahmed','M','2010-02-22','son');

insert into dependent 
Values (1,'mohamed','M','1989-06-22','son');

