SELECT employee_id, last_name, salary*12 AS ANN_SAL, hire_date, department_id
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 3 DESC;

SELECT employee_id, last_name, TO_CHAR(hire_date, 'yyyy-mm-dd'), TO_CHAR(salary, '$99,999')
FROM employees;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d 
ON (e.department_id = d.department_id);

SELECT *
FROM employees;
SELECT *
FROM departments;

SELECT department_id, department_name, TRUNC(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT department_id, TRUNC(AVG(salary)) AS AVG_SAL
FROM employees
GROUP BY department_id
HAVING AVG(salary)>9000;

CREATE TABLE prof
(PROFNO NUMBER(4), NAME VARCHAR2(15)NOT NULL,ID varchar2(15) NOT NULL,HIREDATE date, PAY NUMBER(4));

SELECT TO_CHAR(hiredate, 'yyyy/dd/mm')
FROM prof;

DESC prof;



INSERT INTO prof
VALUES (1001, 'Mark', 'm1001', TO_DATE('07/03/01', 'rr/mm/dd'), 800) ;
INSERT INTO prof
VALUES (1003, 'Adam', 'a1003', TO_DATE('11/03/02', 'rr/mm/dd'), NULL);
COMMIT;
CREATE INDEX prof_name_idx
ON prof(name);
ALTER TABLE prof
ADD CONSTRAINT prof_no_pk PRIMARY KEY(profno);

desc prof;

ALTER TABLE prof ADD gender CHAR(3);
ALTER TABLE prof MODIFY NAME VARCHAR2(20);

CREATE VIEW prof_vu
AS
SELECT profno PNO, name PNAME, id
FROM prof;
SELECT *
FROM prof_vu;


CREATE OR REPLACE VIEW empvu80
AS
SELECT employee_id, last_name empname, salary, hire_date, department_id
FROM employees
WHERE department_id = 80;

CREATE OR REPLACE VIEW prof_vu 
AS
SELECT profno PNO, name PNAME, id, hiredate
FROM prof;

CREATE SYNONYM P_VU FOR prof_vu;

DROP TABLE prof PURGE;

SELECT *
FROM prof_vu;
SELECT table_name, constraint_name, constraint_type, status, search_condition
FROM prof;

SELECT object_name, object_type, status
FROM user_objects
ORDER BY 2;