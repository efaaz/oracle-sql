-- 1. Write a query to display the name, department number for all employees.

SELECT ENAME, DEPTNO FROM EMP;

-- 2. Create a unique listing of all jobs that are in department 30.

SELECT ENAME, JOB, DEPTNO 
FROM EMP
WHERE DEPTNO = 30

-- 3. Include the location of department 30 in the output.

SELECT DEPTNO, LOC
FROM DEPT
WHERE DEPTNO = 30;

-- 4. Write a query to display the employee name, employee no of all employees who earn a commission.

SELECT ENAME, EMPNO, COMM
FROM EMP
WHERE COMM IS NOT NULL;

-- 5. Display the employee name and department no for all employees who have an A in their name.

SELECT ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE '%A%';