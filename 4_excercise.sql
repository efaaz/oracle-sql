-- 1. Find average, maximum, minimum salary of the employees.

SELECT MAX(SAL) AS "MAXIMUM SALARY", ROUND(AVG(SAL)) AS "AVERAGE SALARY", MIN(SAL) AS "MINIMUM SALARY"
FROM EMP;

-- 2. Find average, maximum, minimum salary of the employees according to department number.

SELECT MAX(SAL) AS "MAXIMUM SALARY", ROUND(AVG(SAL)) AS "AVERAGE SALARY", MIN(SAL) AS "MINIMUM SALARY", DEPTNO
FROM EMP
GROUP BY DEPTNO

-- 3. Find average, maximum, minimum salary of the employees according to job category.

SELECT JOB, MAX(SAL) AS "MAXIMUM SALARY", ROUND(AVG(SAL)) AS "AVERAGE SALARY", MIN(SAL) AS "MINIMUM SALARY"
FROM EMP
GROUP BY JOB

-- 4. Find the name of lowest paid manager. (Manager is not Job).

SELECT ENAME, SAL
FROM EMP
WHERE SAL = (SELECT MIN(SAL) FROM EMP WHERE JOB = 'MANAGER');

-- 5. Find the location where maximum number of employee is located

SELECT D.LOC, COUNT(E.EMPNO) AS "Number of Employees"
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.LOC
HAVING COUNT(E.EMPNO) = (
    SELECT MAX(COUNT(E2.EMPNO))
    FROM EMP E2
    JOIN DEPT D2 ON E2.DEPTNO = D2.DEPTNO
    GROUP BY D2.LOC
);


-- 6. Find out job group having highest amount of total salary. (Sal + comm)

SELECT JOB, SUM(SAL + NVL(COMM, 0)) AS "Total Salary"
FROM EMP
GROUP BY JOB
HAVING SUM(SAL + NVL(COMM, 0)) = (
    SELECT MAX(SUM(SAL + NVL(COMM, 0)))
    FROM EMP
    GROUP BY JOB
);


-- 7. Suppose you need to know the name and department no. of the employee who earns the highest salary. Write a SQL query to return this information.

SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);
