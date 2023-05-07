use bd0_2022053_2223;

SELECT * from emp;
SELECT * from department;

/* Subquerys*/

/* 1) */
SELECT * FROM emp
WHERE Sal = (SELECT min(Sal) FROM emp);


/* 2) */
SELECT * FROM emp
WHERE Job = (SELECT Job FROM emp WHERE Name = 'SMITH');

/* 3) */


SELECT * FROM emp
WHERE Sal > (SELECT min(Sal) FROM emp WHERE depno = 30);

/* or */

SELECT * FROM emp
WHERE Sal > ANY (SELECT DISTINCT Sal 
				FROM emp 
				WHERE depno = 30);



/* 4) */

SELECT * FROM emp
WHERE Sal > (SELECT max(Sal) FROM emp WHERE depno = 20);

/* or */

SELECT * FROM emp
WHERE Sal > ALL (SELECT DISTINCT Sal 
				FROM emp 
				WHERE depno = 20);



/* 5) */
SELECT *
FROM emp e1
WHERE Sal > (SELECT AVG(Sal)
			FROM emp e2
			Where e2.depno = e1.depno);
/* !! e1 e2 saxelebis darqmeva aris korelacia !! */

/* 6) */
SELECT *
FROM emp
WHERE empno = ANY (SELECT Manager
				FROM emp );
/* OR */

SELECT *
FROM emp
WHERE empno IN (SELECT Manager
				FROM emp );


/* EXTRA */

/* a) */

SELECT *
FROM emp e1 INNER JOIN department d1
ON e1.depno = d1.dept_no
WHERE e1.Hiredate = (SELECT MIN(e2.Hiredate) FROM emp e2);


/* b) */

SELECT *
FROM emp e1 INNER JOIN department d1
ON e1.depno = d1.dept_no
WHERE e1.Name LIKE 'J%'
AND d1.Dname LIKE 'S%';

/*OR*/

SELECT TABLE1.depno,TABLE1.Name
FROM 
		(SELECT e1.Name,e1.depno FROM emp e1 WHERE	e1.Name LIKE 'J%')AS TABLE1
INNER JOIN
		(SELECT d1.dept_no,d1.Dname FROM department d1 WHERE d1.Dname LIKE 'S%')AS TABLE2
ON TABLE1.depno = TABLE2.dept_no; 


/* c) */

SELECT *
FROM emp e1
WHERE LEN(e1.Name) = (SELECT MIN(LEN(e2.Name))
			FROM emp e2
			Where e2.Job = e1.Job);

/* d) */

SELECT e1.depno,e1.Name,e1.Hiredate,d1.Dname
FROM emp e1 INNER JOIN department d1
ON e1.depno = d1.dept_no
WHERE e1.Hiredate = (SELECT MAX(e2.Hiredate)
			FROM emp e2
			Where e2.depno = e1.depno);

/* e) */


SELECT *
FROM emp e1
WHERE e1.Hiredate < (SELECT e2.Hiredate
			FROM emp e2
			Where e2.Name = 'FORD')
AND e1.Comm IS NULL
ORDER BY e1.Sal ASC;


/* f) */

select e1.Name , e1.Job , e1.depno from emp e1
where e1.depno = 20
and e1.Job in (select distinct e2.Job 
           from emp e2 inner join department d
            on e2.depno = d.dept_no
			where d.Dname = 'SALES') 
order by e1.Name DESC

/* g) */

SELECT *
FROM emp e1
WHERE e1.Sal > (SELECT e2.Sal
			FROM emp e2
			Where e2.Name = 'FORD')
OR e1.Job = (SELECT e2.Job
			FROM emp e2
			Where e2.Name = 'SMITH')
ORDER BY e1.Name DESC;


/* h)  */

SELECT *
FROM emp e1 INNER JOIN department d1
ON e1.depno = d1.dept_no
WHERE (d1.Loc = 'New York'
OR d1.Loc = 'Chicago')
AND e1.Comm IS NOT NULL
ORDER BY e1.Sal DESC;




