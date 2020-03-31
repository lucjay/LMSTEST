--15:04

SELECT employee_id, salary FROM employees;
UPDATE employees
SET salary = 7260
WHERE employee_id = 104;
COMMIT;
SELECT salary FROM employees
AS OF TIMESTAMP (sysdate -8/(24*60))
WHERE employee_id = 104; --플래시백쿼리 고쳐주는 기능은없음 보여주기만함
SELECT versions_starttime, versions_endtime, versions_xid, salary
FROM employees
VERSIONS BETWEEN TIMESTAMP minvalue AND maxvalue
WHERE employee_id = 104;
SELECT undo_sql FROM FLASHBACK_TRANSACTION_QUERY
WHERE table_name = 'EMPLOYEES'
AND table_owner = 'HR'
AND xid = '09002100A8010000';
update "HR"."EMPLOYEES" set "SALARY" = '7260' where ROWID = 'AAAE5oAAEAAAADPAAE';

SELECT current_date, current_timestamp, localtimestamp
FROM dual;
SELECT sysdate, systimestamp
FROM dual;
ALTER SESSION 
SET time_zone = '-10:00';

SELECT current_date, current_timestamp, localtimestamp
FROM dual;
SELECT sysdate, systimestamp
FROM dual;

CREATE TABLE timetest1
(a date,
b timestamp,
c timestamp with time zone,
d timestamp with local time zone);
DESC timetest1;
INSERT INTO timetest1
VALUES (sysdate, sysdate, sysdate, sysdate);
COMMIT;
SELECT * FROM timetest1;

CREATE TABLE emp
AS
SELECT * FROM employees;
DESC emp;
ALTER TABLE emp
MODIFY hire_date timestamp;
SELECT * FROM emp;
CREATE TABLE timetest2
(p interval year to month,
q interval day to second);
DESC timetest2;
INSERT INTO timetest2
VALUES (INTERVAL '30-6' YEAR TO MONTH, INTERVAL '99 12:30:30' DAY TO SECOND);
COMMIT;
SELECT employee_id, hire_date, hire_date+p, hire_date+q
FROM emp, timetest2;
SELECT TO_CHAR(sysdate, 'yyyy') FROM dual;
SELECT employee_id, TO_CHAR(hire_date, 'mm') FROM employees;
SELECT employee_id, last_name, FROM_TZ(hire_date, 'Asia/Seoul')
FROM emp;
SELECT TO_TIMESTAMP('2011-04-22 11:00:00', 'yyyy-mm-dd hh:mi:ss') FROM dual;

SELECT * FROM employees
WHERE salary <(SELECT salary FROM employees WHERE last_name = 'Abel')
AND job_id = (SELECT job_id FROM employees WHERE last_name = 'Abel'); 
SELECT * FROM employees;
@C:\oraclexe\labs\cre_empl.sql;
ROLLBACK;
DROP TABLE empl_demo PURGE;
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

SELECT a.employee_id, a.last_name, a.salary, a.department_id, b.avg_sal
FROM employees a JOIN (SELECT department_id, AVG(salary) avg_sal
FROM employees
GROUP BY department_id) b
ON (a.department_id = b.department_id)
WHERE a.salary > b.avg_sal;

CREATE TABLE emp11
AS
SELECT employee_id, last_name, department_id
FROM employees;

ALTER TABLE emp11
ADD department_name VARCHAR2(25);

SELECT * FROM emp11;

UPDATE emp11
SET department_name = (SELECT department_name FROM departments WHERE emp11.department_id = departments.department_id);


1223



@C:\oraclexe\labs/cre_empl;
SELECT * FROM empl_demo;
SELECT employee_id, manager_id, department_id
FROM empl_demo
WHERE (manager_id, department_id) IN (SELECT manager_id, department_id FROM empl_demo WHERE first_name = 'John')
AND first_name <> 'John';
SELECT employee_id, manager_id, department_id
FROM empl_demo
WHERE manager_id IN (SELECT manager_id FROM empl_demo WHERE first_name = 'John')
AND department_id IN (SELECT department_id FROM empl_demo WHERE first_name = 'John')
AND first_name <> 'John';
@C:\oraclexe\labs\regexp_tab;
SELECT * FROM t1;
SELECT fname, lname
FROM t1
WHERE REGEXP_LIKE (fname, '^Ste(v|ph)en$');
SELECT fname, phone
FROM t1
WHERE REGEXP_LIKE (phone, '...\...\.....\.......');
SELECT fname, phone
FROM t1
WHERE REGEXP_LIKE (phone, '[0-9]{3}\.[0-9]{2}\.[0-9]{4}\.[0-9]{6}') ;
SELECT REPLACE ('Jack and Jue','J','BI')
FROM dual;
SELECT fname, phone, REGEXP_REPLACE ( phone , '\.' , '-' ) new_format
FROM t1 ;
SELECT fname, phone,
REGEXP_REPLACE (phone, '(\d{3})\.(\d{3})\.(\d{4})','(\1)-\2-\3') new_phone
FROM t1 ;
SELECT fname, addr,
REGEXP_INSTR ( addr, '[[:alpha:]]' ) pos ,
phone,
REGEXP_INSTR ( phone, '[[:alpha:]]') pos
FROM t1;
SELECT INSTR('helloworld','l',1,3)
from dual;
SELECT SUBSTR('helloworld', 1,5)
FROM dual;
SELECT fname, addr,
REGEXP_SUBSTR ( addr, ' [^ ]+ ') road
FROM t1 ;
SELECT fname, phone,
REPLACE(REGEXP_SUBSTR(phone,'\.(\d{3})\.'),'.') code
FROM t1 ;
SELECT fname, phone,
REGEXP_SUBSTR(phone,'\.(\d{3})\.')code
FROM t1;
SELECT fname, addr,
REGEXP_COUNT(addr,'a') cnt
FROM t1 ;
SELECT REGEXP_SUBSTR ('0123456789',
'(123)(4(56)(78))', 1, 1, 'i', 1 ) "Exp1" ,
REGEXP_SUBSTR ('0123456789',
'(123)(4(56)(78))', 1, 1, 'i', 2 ) "Exp2" ,
REGEXP_SUBSTR ('0123456789',
'(123)(4(56)(78))', 1, 1, 'i', 3 ) "Exp3" ,
REGEXP_SUBSTR ('0123456789',
'(123)(4(56)(78))', 1, 1, 'i', 4 ) "Exp4"
FROM dual ;
SELECT REGEXP_INSTR ('0123456789',
'(123)(4(56)(78))', 1, 1, 0, 'i', 2 ) "Position"
FROM dual ;
SELECT
REGEXP_INSTR('ccacctttccctccactcctcacgttctcacctgtaaagcgtccctc
cctcatccccatgcccccttaccctgcagggtagagtaggctagaaaccagagagctccaagc
tccatctgtggagaggtgccatccttgggctgcagagagaggagaatttgccccaaagctgcc
tgcagagcttcaccacccttagtctcacaaagccttgagttcatagcatttcttgagttttca
ccctgcccagcaggacactgcagcacccaaagggcttcccaggagtagggttgccctcaagag
gctcttgggtctgatggccacatcctggaattgttttcaagttgatggtcacagccctgaggc
atgtaggggcgtggggatgcgctctgctctgctctcctctcctgaacccctgaaccctctggc
taccccagagcacttagagccag',
'(gtc(tcac)(aaag))',
1, 1, 0, 'i',
1) "Position"
FROM dual;
SELECT REGEXP_COUNT(
'ccacctttccctccactcctcacgttctcacctgtaaagcgtccctccctcatccccatgcccccttaccctgcag
ggtagagtaggctagaaaccagagagctccaagctccatctgtggagaggtgccatccttgggctgcagagagaggag
aatttgccccaaagctgcctgcagagcttcaccacccttagtctcacaaagccttgagttcatagcatttcttgagtt
ttcaccctgcccagcaggacactgcagcacccaaagggcttcccaggagtagggttgccctcaagaggctcttgggtc
tgatggccacatcctggaattgttttcaagttgatggtcacagccctgaggcatgtaggggcgtggggatgcgctctg
ctctgctctcctctcctgaacccctgaaccctctggctaccccagagcacttagagccag',
'gtc') AS Count
FROM dual;                                                                                                                                                                                                                                                                                                                 




12/27

SELECT * FROM session_privs;
CREATE DATABASE LINK prof_std
CONNECT TO hr IDENTIFIED BY hr
USING 'prof';
SELECT * FROM std@prof_std;
CREATE SYNONYM s FOR std@prof_std;
SELECT * FROM s;