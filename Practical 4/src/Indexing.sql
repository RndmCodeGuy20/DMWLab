-- CREATING A SIMPLE (BTREE) INDEX ON EMP
SELECT *
FROM EMP;

CREATE INDEX XX_BTREE_EMPNO_INDX ON EMP (EMPNO);

SELECT EMPNO
FROM EMP;

SELECT *
FROM EMP
WHERE EMPNO = 7369;

EXPLAIN PLAN FOR
(SELECT *
 FROM EMP
 WHERE EMPNO = 7639);

SELECT *
FROM TABLE ( DBMS_XPLAN.DISPLAY );

DROP INDEX XX_BTREE_EMPNO_INDX;

-- CREATING A UNIQUE INDEX ON EMP
SELECT *
FROM EMP;

EXPLAIN PLAN FOR
(SELECT *
 FROM EMP
 WHERE EMPNO = 7639);
SELECT *
FROM TABLE ( DBMS_XPLAN.DISPLAY );

CREATE UNIQUE INDEX XX_UNIQUE_MOBNUM_INDX ON EMP (MOBNUM);

EXPLAIN PLAN FOR
(SELECT *
 FROM EMP
 WHERE MOBNUM = 77986);
SELECT *
FROM TABLE ( DBMS_XPLAN.DISPLAY );

DROP INDEX XX_UNIQUE_MOBNUM_INDX;

-- CREATING A COMPOSITE INDEX ON EMP
SELECT *
FROM EMP;

EXPLAIN PLAN FOR
(SELECT *
 FROM EMP
 WHERE JOB IN ('SALESMAN', 'CLERK')
   AND DEPTNO = 10);
SELECT *
FROM TABLE ( DBMS_XPLAN.DISPLAY );

CREATE INDEX XX_COMP_INDX ON EMP (JOB, DEPTNO);

EXPLAIN PLAN FOR
(SELECT *
 FROM EMP
 WHERE JOB IN ('SALESMAN', 'CLERK')
   AND DEPTNO = 10);
SELECT *
FROM TABLE ( DBMS_XPLAN.DISPLAY );
