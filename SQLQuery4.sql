use bd0_2022053_2223;


DROP TABLE department;

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
	CHECK (Sal>=0),
);

-- sql to create FK
ALTER TABLE emp
ADD CONSTRAINT tb_emp_department_fk
FOREIGN KEY (depno) REFERENCES department(dept_no);

-- delete fk
ALTER TABLE emp
DROP CONSTRAINT tb_emp_department_fk;


CREATE TABLE department (
dept_no INT PRIMARY KEY,
Dname varchar(255),
Loc varchar(255)
);




/*
rogor gadavakopirot erti cxrilidan meoreshi

INSERT INTO emp2
SELECT * FROM emp;

ogond emp da emp 1 unda iyos sruliad identuri

*/


Insert into department (dept_no,Dname,Loc)
VALUES (10,'ACCOUNTING','NEW YORK');

Insert into department (dept_no,Dname,Loc)
VALUES (20,'RESEARCH','DALLAS');

Insert into department (dept_no,Dname,Loc)
VALUES (30,'SALES','CHICAGO');

Insert into department (dept_no,Dname,Loc)
VALUES (40,'OPERATIONS','BOSTON');



select *from emp;
select *from department;

--1
SELECT emp.name,emp.Job,
FROM emp
INNER JOIN department
ON emp.depno = department.dept_no;


SELECT emp.name,emp.Job,department.Dname
FROM emp
JOIN department
ON emp.depno = department.dept_no;


--2

select * 
FROM emp e1 cross join emp e2
WHERE e1.manager = e2.empno
AND e1.Sal > e2.Sal;





INSERT INTO emp2
SELECT * FROM emp;


/* a) Create a query that lists the name of the department and the respective number of workers.*/

Select d.Dname,COUNT(*) NumEmpregados
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
GROUP BY d.Dname;


/* b) Create a query that lists the department name and its number of workers. Only departments with at least five workers are shown in the result.*/
Select d.Dname,COUNT(*) NumEmpregados
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
GROUP BY d.Dname
HAVING COUNT(*) >=5;

/* c) Create a query that lists the department name and its average salary, but only for departments that do not start with the letter 'S'. You must present the result in ascending order of the average salary.*/
Select d.Dname,AVG(Sal) avrg_salary_by_departament
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
GROUP BY d.Dname
HAVING Dname NOT LIKE 'S%'
ORDER BY avrg_salary_by_departament ASC;


 /* es uketesia radgan dros ar kargav piradpir igeb rac ginda , zemot ajgufeb mtlianad da mere awri im nawils sadac s it iwyeba, es araefeqturia*/
Select d.Dname,AVG(Sal) avrg_salary_by_departament
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE d.Dname NOT LIKE 'S%'
GROUP BY d.Dname
ORDER BY avrg_salary_by_departament ASC;
/* es bolo ori erti da igivea*/
Select d.Dname,AVG(Sal) avrg_salary_by_departament
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE d.Dname NOT LIKE 'S%'
GROUP BY d.Dname
ORDER BY 2 ASC;

/*d) Create a query that lists the name of the employees who work in the 'ACCOUNTING' department, and who were hired in the first semester. You must present the result starting with those who have been most recently admitted. */
Select e.Name,d.Dname,e.Hiredate
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE d.Dname = 'ACCOUNTING'
AND MONTH(e.Hiredate) IN (1,2,3,4,5,6)
ORDER BY e.Hiredate DESC;
/* OR */
Select e.Name,d.Dname,e.Hiredate
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE d.Dname = 'ACCOUNTING'
AND MONTH(e.Hiredate) <=6
ORDER BY e.Hiredate DESC;

/*e) Create a query that lists the names of employees, their roles, and their salaries. These employees must work in the ' RESEARCH' department, and their salaries must vary between 1000 and 3000. Present the result ordered by job, from Z to A*/
Select e.Name, e.Job, e.Sal
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE d.Dname = 'RESEARCH'
AND e.Sal BETWEEN 1000 AND 3000
ORDER BY e.Job DESC;

/*f) Create a query that lists the names of employees, the date of admission, as well as the respective names of the departments that had employees hired in the last quarter of the year '1981'. Results must be sorted by department name. */
Select e.Name, e.Hiredate, d.Dname
From emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE YEAR(e.Hiredate) = 1981
AND MONTH(e.Hiredate) IN(10 ,11 ,12)
ORDER BY 3;


/* g) Create a query that lists the names of employees, their job, as well as their department names. This query should only contain the names of the departments consisting of exactly 5 letters. Present the result ordered by department name, and within it by function. */
SELECT e.Name,e.Job,d.Dname
FROM emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE LEN(d.Dname) = 5
ORDER BY 3,2;
/*OR*/
SELECT e.Name,e.Job,d.Dname
FROM emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE d.Dname LIKE '_____'
ORDER BY 3,2;

/* h) List the name and job of all employees whose job is neither 'clerk' nor 'salesman'and whose name ends with 's', 'k' or 'g', and who work in the ' ACCOUNTING' department. */
SELECT e.Name,e.Job,d.Dname
FROM emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE e.Job NOT LIKE 'CLERK'
AND e.Job NOT LIKE 'SALESMAN'
AND (e.Name LIKE '%s' OR e.Name LIKE '%k' OR e.Name LIKE '%g')
AND d.Dname = 'ACCOUNTING';

/* i) List all information about employees and the name of their respective department, who joined the company between 1981.Jan.01 and 1982.Dec.31 and whose commission is not null. These workers must not work in either the 'SALES' or the 'ACCOUNTING' department. */
SELECT e.*,d.Dname
FROM emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE e.Hiredate BETWEEN '1981.1.1' AND '1982.12.31'
AND Comm IS NOT NULL 
AND d.Dname NOT IN ('SALES','ACCOUNTING');


/* j)List all information for employees whose name begins with a vowel and does not contain the letter 'N'. You must also ensure that they work in a department in 'Dallas'. */

SELECT e.*,d.*
FROM emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE (e.Name LIKE 'A%' OR e.Name LIKE 'E%'  OR e.Name LIKE 'U%'  OR e.Name LIKE 'O%') 
AND (e.Name NOT LIKE '%N%' OR e.Name NOT LIKE '%n%')
AND d.Loc = 'Dallas';
/* or (n da N ertia amistvis), aseve '[a-f]%' nishnavs yvela asoti dawyebas a dan f amde*/
SELECT e.*,d.*
FROM emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE (e.Name LIKE '[a,e,i,o,u]%' ) 
AND e.Name NOT LIKE '%n%'
AND d.Loc = 'Dallas';


/**/
SELECT e.Name,LEFT(e.Name,2) left2,RIGHT(e.Name,2) right2
FROM emp e;
/**/

SELECT e.*,d.*
FROM emp e INNER JOIN department d
	ON e.depno = d.dept_no
WHERE LEFT(e.Name,1) IN ('a','e','i','o','u')
AND e.Name NOT LIKE '%n%'
AND d.Loc = 'Dallas';


/* k) add colomn and add supervisers ??? */

/* vamatebt axal svets,shecvla,washla */
ALTER TABLE department
ADD supervisor varchar(255);

ALTER TABLE department
ALTER COLUMN  supervisor INT;

ALTER TABLE department
DROP COLUMN  supervisor;

/* vaniwebt mnishvnelobas */

UPDATE department
SET supervisor = 7782
WHERE dept_no = 10;

UPDATE department
SET supervisor = 7566
WHERE dept_no = 20;

UPDATE department
SET supervisor = 7499
WHERE dept_no = 30;

UPDATE department
SET supervisor = 7369
WHERE dept_no = 40;

/* OR */

UPDATE department
SET supervisor = (SELECT emp.empno FROM emp WHERE emp.Name LIKE 'Smith')
WHERE dept_no = 40;

SELECT * FROM emp;


/* l)List the name of the departments with supervisors who have been admitted in the even months of the year 1981. The result must also show the supervisor's name and the respective admission date. Sort the result by seniority of admission. */

SELECT e.*,d.*
FROM emp e INNER JOIN department d
	ON e.empno = d.supervisor
WHERE YEAR(e.Hiredate) = 1981
AND MONTH(e.Hiredate)%2 = 0
ORDER BY e.Hiredate;


/* m)List the name of supervisors, salary, commission, date of admission and function, who do not receive a commission, and that their salary is less than 25000. Make sure that the solution does not include supervisors who have the function ‘Clerk’. Order the result by admission date from most recent to oldest. */

SELECT e.Name,d.supervisor,e.Sal,e.Comm,e.Hiredate,e.Job
FROM emp e INNER JOIN department d
	ON e.empno = d.supervisor
WHERE e.Comm IS NULL
AND e.Sal < 2500
AND e.Job NOT LIKE 'CLERK';

/* n) List the names of employees who have the same number of months of service with the company (i.e. were hired in the same month and year).  */

SELECT e1.Name,e2.Name
FROM emp e1 CROSS JOIN emp e2
WHERE YEAR(e1.Hiredate) = YEAR(e2.Hiredate)
AND MONTH(e1.Hiredate) = MONTH(e2.Hiredate)
AND e1.empno != e2.empno
ORDER BY e2.Name;

/* cros joinshi ar gwirdeba on statement yvela rigs aqvs tavisi mtliani cxrili*/




