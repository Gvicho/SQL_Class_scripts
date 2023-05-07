/*lecture 3*/
use bd0_2022053_2223;


DROP TABLE emp;


select *from emp;


/* 1) calc avarage*/

SELECT AVG(Sal) AS AVRG
FROM emp;
/*WHERE contition*/

/*2) calc min*/

SELECT MIN(Sal) AS SmallestSal
FROM emp;


/*3) how many employs does dep 20 has*/

SELECT COUNT(depno) 
FROM emp
WHERE depno = 20;

/*4) avarage sal for each role*/

SELECT Job, AVG(Sal) AS AVRG  FROM emp GROUP BY Job;

/*5) avrg for each role exept president */

SELECT Job, AVG(Sal) AS AVRG  
FROM emp 
WHERE Job != 'PRESIDENT'
GROUP BY Job;

/*6) each role with dep*/

SELECT depno, AVG(Sal) AS AVRG  FROM emp GROUP BY depno;

/*7) min for each role*/

SELECT depno, MIN(Sal) AS minsal  FROM emp GROUP BY depno;

/*8) if more than 4 people */

SELECT depno, AVG(Sal) AS AVRG  
FROM emp 
GROUP BY depno
HAVING COUNT(depno)>4;

/*9) if max sal is mor or equal 2000 */

SELECT Job 
FROM emp 
GROUP BY Job
HAVING MAX(Sal)>=2000;


/*EXTRA */

/* a) later than 1/2/2000 */

SELECT 'After 1/Jan/1982' AS 'initial Date',COUNT(Hiredate) as NumberOfEmpoys
FROM emp 
WHERE Hiredate >= '1982-1-1';

/* b)Creates a query that returns the name of the first and last employee in alphabetical order, as well as the number of employees registered in the database  */

SELECT MIN(Name) AS 'FIRST',MAX(Name) AS 'SECOND',COUNT(Name) 
FROM emp;


/* c) Create a query that returns the average salary amount for each department. The result must only contain departments whose average amount is greater than 17000. The result must be ordered by the average amount in descending order. */

SELECT depno, AVG(Sal) AS AVRG 
FROM emp 
GROUP BY depno
HAVING AVG(Sal) >=1700
ORDER BY AVRG DESC;

/* d) Create a query that returns the total number of employees and the amount of the most and least expensive salaries, whose hire date is after 1/1/1981. */
SELECT 'After 1/1/1981' AS 'Initial date',COUNT (Name) AS 'Number of employees', Max(Sal) AS 'Higest Sal', MIN(Sal) AS 'Lowest Sal' 
FROM emp
WHERE Hiredate >= '1981-1-1';