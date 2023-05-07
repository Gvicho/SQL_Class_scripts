reate database bd0_2022053_2223;
use bd0_2022053_2223;




Create table emp (
	empno int,
	Name nvarchar(255),
	Job varchar(255),
	Manager int,
	Hiredate date,
	Sal int DEFAULT 100 NOT NULL,
	Comm int,
	depno int,
	PRIMARY KEY(empno),
	UNIQUE (Name),
	CHECK (Sal>=0)
);


DROP TABLE emp;


select *from emp;


Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
VALUES (7369,'SMITH','CLERK',7902,'1980-dec-17',800,NULL,20);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
VALUES (7499,'ALLEN','SALESMAN',7698,'20-feb-81',1600,300,30);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
VALUES (7521,'WARD','SALESMAN',7698,'22-may-81',1250,500,30);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
VALUES (7566,'JONES','MANAGER',7839,'02-apr-81',2975,NULL,20);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
VALUES (7654,'MARTIN','SALESMAN',7698,'28-sep-81',1250,1400,30);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
VALUES (7698,'BLAKE','MANAGER',7839,'01-may-81',2850,NULL,30);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
VALUES (7782,'CLARK','MANAGER',7839,'09-jun-81',2450,NULL,10);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
values (7788,'SCOTT','ANALYST',7566,'1982-dec-09',3000,NULL,20);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
values (7839,'KING','PRESIDENT',NULL,'1981-nov-17',5000,NULL,10);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
values (7844,'TURNER','SALESMAN',7698,'1981-sep-08',1500,NULL,30);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
values (7876,'ADAMS','CLERK',7788,'1983-jan-12',1100,NULL,20);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
values (7900,'JAMES','CLERK',7698,'1981-dec-03',950,NULL,30);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
values (7902,'FORD','ANALYST',7566,'1981-dec-03',3000,NULL,20);

Insert into emp (empno,Name,Job,Manager,Hiredate,Sal,Comm,depno)
values (7934,'MILLER','CLERK',7782,'1982-jan-23',1300,NULL,10);


SELECT Name,Job 
FROM emp
WHERE Sal >1000;

SELECT Name,Job,Sal,Comm,Sal+Comm 
FROM emp;







/*
Lecture 2
*/

/* 1) sadac araa comisia*/
SELECT * FROM emp
WHERE Comm is NULL;

/* 2)xelfass plius 10 procenti */
SELECT Sal,Sal + Sal / 10 'Sal + 10%',Job FROM emp;

/* 3)departament numberis zrdadobit saxelis klebadobit , comisia sadac 0ia */
Select depno,Name,Comm FROM emp
WHERE Comm is NULL
ORDER BY depno,Name DESC ;

/* 4)meore asoa A bolo S saxelshi */
SELECT depno,Name,Sal FROM emp
WHERE Name like '_A%S';

/* 5)uxucesi mushaki */
SELECT TOP (1) Name,Hiredate FROM emp
ORDER BY Hiredate DESC;

/* 6) klebadobit prosta*/
Select Name,Hiredate FROM emp
ORDER BY Hiredate DESC ;

/* 7) romelta profesiaa clerki da romelta saxeli mtavrdeba s_ze*/
SELECT * FROM emp
WHERE Job = 'CLERK'
AND Name like '%s';

/* 8) menegeria 7698 da Com<4000 */
SELECT * FROM emp
WHERE Manager = 7698
AND Comm <=400;

/*9) photo*/

/* 11) ar mushaoben 20 da 30 departamentebshi */

SELECT * FROM emp
WHERE depno != 20 AND depno != 30;


/* 12) ragackleoba  */

SELECT Name,Job,Sal,depno FROM emp
WHERE depno in (10,20) AND Sal>=2500 AND Sal<=3500
AND Job = 'ANALYST'
ORDER BY Sal DESC;

