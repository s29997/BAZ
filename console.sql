/*~-~-~-~-~-~-~-~ RESET OF DB ~-~-~-~-~-~-~-~*/
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE SALGRADE;

CREATE TABLE EMP
       (EMPNO INT NOT NULL,
        ENAME VARCHAR(10),
        JOB VARCHAR(9),
        MGR INT,
        HIREDATE DATETIME,
        SAL INT,
        COMM INT,
        DEPTNO INT);

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        CONVERT(DATETIME,'17-DEC-1980'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        CONVERT(DATETIME,'20-FEB-1981'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        CONVERT(DATETIME,'22-FEB-1981'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        CONVERT(DATETIME,'2-APR-1981'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        CONVERT(DATETIME,'28-SEP-1981'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        CONVERT(DATETIME,'1-MAY-1981'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        CONVERT(DATETIME,'9-JUN-1981'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        CONVERT(DATETIME,'09-DEC-1982'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        CONVERT(DATETIME,'17-NOV-1981'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        CONVERT(DATETIME,'8-SEP-1981'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        CONVERT(DATETIME,'12-JAN-1983'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        CONVERT(DATETIME,'3-DEC-1981'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        CONVERT(DATETIME,'3-DEC-1981'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        CONVERT(DATETIME,'23-JAN-1982'), 1300, NULL, 10);

CREATE TABLE DEPT
       (DEPTNO INT,
        DNAME VARCHAR(14),
        LOC VARCHAR(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE SALGRADE
        (GRADE INT,
         LOSAL INT,
         HISAL INT);

INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);


/*~-~-~-~-~-~-~-~ SQL1 ~-~-~-~-~-~-~*/
/*~~~~~~~ TASK 1 ~~~~~~~*/
SELECT DEPTNO, ENAME, MGR AS BOSS_EMPNO FROM EMP
/*~~~~~~~ TASK 2 ~~~~~~~*/
SELECT * FROM EMP
/*~~~~~~~ TASK 3 ~~~~~~~*/
SELECT ENAME, SAL * 12 AS ANNUAL_BASE_SALARY FROM EMP
/*~~~~~~~ TASK 4 ~~~~~~~*/
SELECT ENAME, (SAL + 250) * 12 AS ANNUAL_BASE_SALARY_WITH_RAISE FROM EMP
/*~~~~~~~ TASK 5 ~~~~~~~*/
SELECT CONCAT(EMPNO, '-', ENAME) AS EMPLOYEE FROM EMP
/*~~~~~~~ TASK 6 ~~~~~~~*/
SELECT CONCAT(ENAME, ' works in department ', DEPTNO) AS EMPLOYEE_DEPARTMENT FROM EMP
/*~~~~~~~ TASK 7 ~~~~~~~*/
SELECT ENAME, (SAL + ISNULL(COMM, 0)) * 12 AS ANNUAL_TOTAL_SALARY FROM EMP
/*~~~~~~~ TASK 8 ~~~~~~~*/
SELECT DEPTNO FROM EMP
/*~~~~~~~ TASK 9 ~~~~~~~*/
SELECT DISTINCT DEPTNO FROM EMP
/*~~~~~~~ TASK 10 ~~~~~~~*/
SELECT * FROM EMP
ORDER BY ENAME
/*~~~~~~~ TASK 11 ~~~~~~~*/
SELECT * FROM EMP
ORDER BY HIREDATE DESC
/*~~~~~~~ TASK 12 ~~~~~~~*/
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, COMM, DEPTNO FROM EMP
ORDER BY DEPTNO, SAL DESC
/*~~~~~~~ TASK 13 ~~~~~~~*/
SELECT ENAME, EMPNO, JOB, DEPTNO FROM EMP
WHERE JOB = 'CLERK'
/*~~~~~~~ TASK 14 ~~~~~~~*/
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO > 20
/*~~~~~~~ TASK 15 ~~~~~~~*/
SELECT * FROM EMP
WHERE COMM > SAL
/*~~~~~~~ TASK 16 ~~~~~~~*/
SELECT * FROM EMP
WHERE SAL BETWEEN 1000 AND 2000
/*~~~~~~~ TASK 17 ~~~~~~~*/
SELECT * FROM EMP
WHERE MGR IN (7902, 7566, 7788)
/*~~~~~~~ TASK 18 ~~~~~~~*/
SELECT * FROM EMP
WHERE ENAME LIKE 'S%'
/*~~~~~~~ TASK 19 ~~~~~~~*/
SELECT * FROM EMP
WHERE MGR IS NULL
/*~~~~~~~ TASK 20 ~~~~~~~*/
SELECT * FROM EMP
WHERE SAL NOT BETWEEN 1000 AND 2000
/*~~~~~~~ TASK 21 ~~~~~~~*/
SELECT * FROM EMP
WHERE ENAME NOT LIKE 'M%'
/*~~~~~~~ TASK 22 ~~~~~~~*/
SELECT * FROM EMP
WHERE MGR IS NOT NULL
/*~~~~~~~ TASK 23 ~~~~~~~*/
SELECT * FROM EMP
WHERE JOB = 'CLERK' AND SAL BETWEEN 1000 AND 2000
/*~~~~~~~ TASK 24 ~~~~~~~*/
SELECT * FROM EMP
WHERE JOB = 'CLERK' OR SAL BETWEEN 1000 AND 2000
/*~~~~~~~ TASK 25 ~~~~~~~*/
SELECT * FROM EMP
WHERE (JOB = 'MANAGER' AND SAL > 1500) OR JOB = 'SALESMAN'
/*~~~~~~~ TASK 26 ~~~~~~~*/
SELECT * FROM EMP
WHERE (JOB = 'MANAGER' OR JOB = 'SALESMAN') AND SAL > 1500
/*~~~~~~~ TASK 27 ~~~~~~~*/
SELECT * FROM EMP
WHERE (JOB = 'MANAGER') OR (JOB = 'CLERK' AND DEPTNO = 10)
/*~~~~~~~ TASK 28 ~~~~~~~*/
SELECT * FROM SALGRADE
/*~~~~~~~ TASK 29 ~~~~~~~*/
SELECT * FROM DEPT
/*~~~~~~~ TASK 31 ~~~~~~~*/
SELECT DEPTNO, DNAME FROM DEPT
ORDER BY DEPTNO
/*~~~~~~~ TASK 32 ~~~~~~~*/
SELECT DISTINCT JOB FROM EMP
/*~~~~~~~ TASK 33 ~~~~~~~*/
SELECT * FROM EMP
WHERE DEPTNO IN (10, 20)
ORDER BY ENAME
/*~~~~~~~ TASK 34 ~~~~~~~*/
SELECT ENAME FROM EMP
WHERE ENAME LIKE '%TH%' OR ENAME LIKE '%LL%'


/*~-~-~-~-~-~-~-~ SQL2 ~-~-~-~-~-~-~*/
/*~~~~~~~ TASK 1 ~~~~~~~*/
SELECT EMP.*, DEPT.* FROM EMP
INNER JOIN DEPT on EMP.DEPTNO = DEPT.DEPTNO
/*~~~~~~~ TASK 2 ~~~~~~~*/
SELECT EMP.ENAME, DEPT.DNAME FROM EMP
INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMP.ENAME
/*~~~~~~~ TASK 3 ~~~~~~~*/
SELECT EMP.ENAME, DEPT.DEPTNO, DEPT.DNAME FROM EMP
INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
/*~~~~~~~ TASK 4 ~~~~~~~*/
SELECT EMP.ENAME, DEPT.LOC, DEPT.DNAME FROM EMP
INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMP.SAL > 1500
/*~~~~~~~ TASK 5 ~~~~~~~*/
SELECT EMP.ENAME, EMP.JOB, EMP.SAL, SALGRADE.GRADE FROM EMP
INNER JOIN SALGRADE ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
/*~~~~~~~ TASK 6 ~~~~~~~*/
SELECT EMP.* FROM EMP
INNER JOIN SALGRADE ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
WHERE SALGRADE.GRADE = 3
/*~~~~~~~ TASK 7 ~~~~~~~*/
SELECT EMP.* FROM EMP
INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE DEPT.LOC = 'DALLAS'
/*~~~~~~~ TASK 8 ~~~~~~~*/
SELECT EMP.ENAME, DEPT.DNAME, SALGRADE.GRADE FROM EMP
INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
INNER JOIN SALGRADE ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
/*~~~~~~~ TASK 9 ~~~~~~~*/
SELECT DEPT.*, EMP.* FROM DEPT
LEFT JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO
/*~~~~~~~ TASK 10 ~~~~~~~*/
SELECT DEPT.*, EMP.* FROM EMP
LEFT JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
/*~~~~~~~ TASK 11.1 ~~~~~~~*/
-- Employees from departments 30 and 20
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO IN (20, 30)
/*~~~~~~~ TASK 11.1 ~~~~~~~*/
-- Department 20 without names
SELECT * FROM DEPT
WHERE DEPTNO = 20
/*~~~~~~~ TASK 12 ~~~~~~~*/
SELECT DISTINCT JOB FROM EMP
WHERE DEPTNO IN (10, 30)
/*~~~~~~~ TASK 13 ~~~~~~~*/
SELECT DISTINCT JOB FROM EMP
WHERE DEPTNO = 10

INTERSECT

SELECT DISTINCT JOB FROM EMP
WHERE DEPTNO = 30
/*~~~~~~~ TASK 14 ~~~~~~~*/
SELECT DISTINCT JOB FROM EMP
WHERE DEPTNO = 10

EXCEPT

SELECT DISTINCT JOB FROM EMP
WHERE DEPTNO = 30
/*~~~~~~~ TASK 15 ~~~~~~~*/
SELECT E.ENAME AS EMPLOYEE, M.ENAME AS MANAGER FROM EMP E
INNER JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.SAL < M.SAL
/*~~~~~~~ TASK 16 ~~~~~~~*/
SELECT E.ENAME AS EMPLOYEE, M.ENAME AS MANAGER FROM EMP E
LEFT JOIN EMP M ON E.MGR = M.EMPNO
ORDER BY M.ENAME


/*~-~-~-~-~-~-~-~ SQL3 ~-~-~-~-~-~-~*/
/*~~~~~~~ TASK 1 ~~~~~~~*/
SELECT AVG(SAL) AS AVERAGE_EARNINGS FROM EMP
/*~~~~~~~ TASK 2 ~~~~~~~*/
SELECT MIN(SAL) AS MINIMUM_CLERK_EARNINGS FROM EMP
WHERE JOB = 'CLERK'
/*~~~~~~~ TASK 3 ~~~~~~~*/
SELECT COUNT(*) AS EMPLOYEE_COUNT FROM EMP
WHERE DEPTNO = 20
/*~~~~~~~ TASK 4 ~~~~~~~*/
SELECT JOB, AVG(SAL + ISNULL(COMM, 0)) AS AVERAGE_EARNINGS FROM EMP
GROUP BY JOB
/*~~~~~~~ TASK 5 ~~~~~~~*/
SELECT JOB, AVG(SAL + ISNULL(COMM, 0)) AS AVERAGE_EARNINGS FROM EMP
WHERE JOB <> 'MANAGER'
GROUP BY JOB
/*~~~~~~~ TASK 6 ~~~~~~~*/
SELECT DEPTNO, JOB, AVG(SAL + ISNULL(COMM, 0)) AS AVERAGE_EARNINGS FROM EMP
GROUP BY DEPTNO, JOB
/*~~~~~~~ TASK 7 ~~~~~~~*/
SELECT JOB, MAX(SAL + ISNULL(COMM, 0)) AS MAX_EARNINGS FROM EMP
GROUP BY JOB
/*~~~~~~~ TASK 8 ~~~~~~~*/
SELECT DEPTNO, AVG(SAL + ISNULL(COMM, 0)) AS AVERAGE_EARNINGS FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3
/*~~~~~~~ TASK 9 ~~~~~~~*/
SELECT JOB, AVG(SAL + ISNULL(COMM, 0)) AS AVERAGE_EARNINGS FROM EMP
GROUP BY JOB
HAVING AVG(SAL + ISNULL(COMM, 0)) >= 3000
/*~~~~~~~ TASK 10 ~~~~~~~*/
SELECT JOB,
       AVG(SAL + ISNULL(COMM, 0)) AS AVERAGE_MONTHLY_SALARY,
       AVG((SAL + ISNULL(COMM, 0)) * 12) AS AVERAGE_ANNUAL_EARNINGS
FROM EMP
GROUP BY JOB
/*~~~~~~~ TASK 11 ~~~~~~~*/
SELECT MAX(SAL) - MIN(SAL) AS SALARY_DIFFERENCE FROM EMP
/*~~~~~~~ TASK 12 ~~~~~~~*/
SELECT DEPTNO, COUNT(*) AS EMPLOYEE_COUNT FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3
/*~~~~~~~ TASK 13 ~~~~~~~*/
SELECT COUNT(EMPNO) - COUNT(DISTINCT EMPNO) AS NOT_UNIQUE_EMPLOYEES FROM EMP
/*~~~~~~~ TASK 14 ~~~~~~~*/
SELECT MGR, MIN(SAL) AS MIN_SALARY FROM EMP
GROUP BY MGR
HAVING MIN(SAL) >= 1000
ORDER BY MIN_SALARY
/*~~~~~~~ TASK 15 ~~~~~~~*/
SELECT DEPT.DEPTNO, COUNT(EMP.EMPNO) AS EMPLOYEE_COUNT FROM DEPT
LEFT JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO
WHERE DEPT.LOC = 'DALLAS'
GROUP BY DEPT.DEPTNO
/*~~~~~~~ TASK 16 ~~~~~~~*/
SELECT SALGRADE.GRADE, MAX(SAL) AS MAX_EARNINGS FROM EMP
INNER JOIN SALGRADE ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
GROUP BY SALGRADE.GRADE
/*~~~~~~~ TASK 17 ~~~~~~~*/
SELECT SAL, COUNT(*) AS OCCURRENCES FROM EMP
GROUP BY SAL
HAVING COUNT(*) > 1
/*~~~~~~~ TASK 18 ~~~~~~~*/
SELECT AVG(SAL + ISNULL(COMM, 0)) AS AVERAGE_EARNINGS FROM EMP
INNER JOIN SALGRADE ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
WHERE SALGRADE.GRADE = 2
/*~~~~~~~ TASK 19 ~~~~~~~*/
SELECT MGR, COUNT(*) AS SUBORDINATE_COUNT FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
/*~~~~~~~ TASK 20 ~~~~~~~*/
SELECT SUM(SAL + ISNULL(COMM, 0)) AS TOTAL_EARNINGS FROM EMP
INNER JOIN SALGRADE ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
WHERE SALGRADE.GRADE = 1