-- 1. Create a query to display the name and salary of employees earning more than $2850.

SELECT ENAME, SAL
FROM EMP
WHERE SAL>2850;

-- 2. Create a query to display the employee name and department number for employee number 7566.

SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO = 7566

-- 3. Display the employee name, job, and start date of employees hired between February 20, 1981, and May 1, 1981. Order the query in ascending order by start date.

SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN TO_DATE('20-FEB-1981', 'DD-MON-YYYY') AND TO_DATE('01-MAY-1981', 'DD-MON-YYYY')
ORDER BY HIREDATE ASC;

-- 4. Display the employee name and department number of all employees in departments 10 and 30 in alphabetical order by name.

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (10, 30)
ORDER BY ENAME;

-- 5. Write a query to list the name and salary of employees who earn more than $1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary, respectively.

SELECT ENAME AS "EMPLOYEE", SAL "MONTHLY SALARY"
FROM EMP
WHERE SAL > 1500 AND DEPTNO IN (10, 30);

-- 6. Display the name and hire date of every employee who was hired in 1982.

SELECT ENAME, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YYYY') = '1982';

-- 7. Display the name and job title of all employees who do not have Mamanager.

SELECT ENAME, JOB, MGR
FROM EMP
WHERE MGR IS NULL;

-- 8. Display the name, salary, and commission for all employees who earn commissions Sort data in descending order of salary and commissions

SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY SAL DESC, COMM DESC;