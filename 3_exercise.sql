-- 1. Write a query to display the current date. Label the column Date.

SELECT SYSDATE AS "DATE";
FROM DUAL;

-- 2. Display the employee number, name, salary, and salary increase by 15% expressed as a whole number. Label the column New Salary.

SELECT EMPNO, ENAME, SAL, ROUND(SAL+(SAL*0.15)) AS "NEW SALARY"
FROM EMP

-- 3. Modify your previous query to add a column that will subtract the old salary from the new salary. Label the column Increase. Rerun your query.

SELECT EMPNO, ENAME, SAL, ROUND(SAL+(SAL*0.15)) AS "NEW SALARY",
ROUND(SAL+(SAL*0.15)-SAL) AS "INCREASED"
FROM EMP;

-- 4. Display the employee’s name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the format similar to “Sunday, the Seventh of September, 1981.”

SELECT ENAME, 
TO_CHAR(HIREDATE, 'Day, "the" Ddspth "of" Month, YYYY') AS "Hire Date", 
TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 6), 'MONDAY'), 'Day, "the" Ddspth "of" Month, YYYY') AS "Review"
FROM EMP;

-- 5. For each employee display the employee name and calculate the number of months between today and the date the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. Round the number of months up to the closest whole number.

SELECT ENAME,
       CEIL(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "MONTHS_WORKED"
FROM EMP
ORDER BY MONTHS_BETWEEN(SYSDATE, HIREDATE);

-- 6. Write a query that produces the following for each employee: <employee name> earns <salary> monthly but wants <3 times salary>. Label the column Dream Salaries.
SELECT ENAME || ' earns ' || SAL || ' monthly but wants ' || (SAL*3) AS "DREAM SALARIES"
FROM EMP;

-- 7. Write a query that will display the employee’s name with the first letter capitalized and all other letters lowercase and the length of their name, for all employees whose name starts with J, A,or M. Give each column an appropriate label.

SELECT INITCAP(ENAME) AS "NAME", LENGTH(ENAME) AS "NAME LENGTH"
FROM EMP
WHERE ENAME LIKE 'A%' OR ENAME LIKE 'J%' OR ENAME LIKE 'M%';

-- 8. Create a query that will display the employee name and commission amount. If the employee does not earn commission, put “No Commission.” Label the column COMM.

SELECT ENAME, NVL(TO_CHAR(COMM), 'No Commission') AS "COMM"
FROM EMP;

-- 9. Create a query that displays the employees’ names and indicates the amounts of their salaries through asterisks. Each asterisk signifies a hundred dollars Sort the data in descending order of salary. Label the column EMPLOYEE_AND_THEIR_SALARIES.

SELECT ENAME || ' ' || RPAD('*', SAL/100, '*') AS "EMPLOYEE_AND_THEIR_SALARIES"
FROM EMP
ORDER BY SAL DESC;