--create table syntax
create table university{
 id int, 
university_name varchar(100), 
primary key(id)
 };

--Create table from select
CREATE TABLE target AS (SELECT * FROM source where 10=20);


--Oracle	
ALTER TABLE target_table_name MODIFY (column_1 data_type...column_n data_type);
--MySQL, MariaDB	
ALTER TABLE target_table_name MODIFY column_1 data_type, MODIFY column_2 data_type...
;
--SQL Server	
--No direct support multiple alter statements required
--PostgreSQL
ALTER TABLE target_table_name ALTER COLUMN column_name TYPE data_type,  ALTER COLUMN column_name TYPE data_type,
--rename syntax
--Oracle
	ALTER TABLE target_table_name RENAME COLUMN old_column_name TO new_column_name;
--MySQL, MariaDB	
ALTER TABLE target_table_name CHANGE COLUMN old_column_name TO new_column_name;
--SQL Server	
sp_rename 'target_table_name.old_column_name', 'new_column_name', 'COLUMN';
--PostgreSQL

	ALTER TABLE target_table_name RENAME COLUMN old_column_name TO new_column_name;

SELECT UPPER(student_name ) AS student_name_upper FROM student;

SELECT COUNT(*) from student

SELECT * FROM student WHERE marks BETWEEN 60 AND 100;


--MYSQLMARIADB
	SELECT * FROM student order by id desc LIMIT N;
--SQL Server	
SELECT TOP N * FROM student order by id desc;
--Oracle 12cPOSTGRES	
SELECT * FROM   student order by id desc ending FETCH FIRST 5 ROWS ONLY;
--Oracle
	SELECT * FROM student WHERE rownum <= 5 order by id desc
	
SELECT CONCAT(fname, ' :', lname) AS student_name FROM student;


SELECT * from student where name like ‘%Z’
SELECT * from student where name like ‘Z%’
SELECT * from student where name like ‘%Z%’

SELECT * from student where roll_no not in (10,30)

SELECT * from student where roll_no in (10,20,30)


SELECT dept_name, count(*) as dept_count from student group by dept_name.


SELECT dept_name, count(*) as cnt from student group by dept_name order by cnt desc


SELECT DISTINCT mark FROM student s1 WHERE 3 >= (SELECT COUNT(DISTINCT mark )FROM student s2 WHERE s1.mark >= s2.mark) ORDER BY s1.mark DESC;
SELECT DISTINCT mark FROM student s1 WHERE 3 >= (SELECT COUNT(DISTINCT mark )FROM student s2 WHERE s1.mark <= s2.mark) ORDER BY s1.mark DESC;

SELECT mark
FROM student s1 
WHERE N-1 = ( 
      SELECT COUNT( DISTINCT ( s1.Salary ) ) 
      FROM student s2 
      WHERE s2.mark >  s1.mark );


SELECT student_name, dept_name, COUNT(*)  FROM student GROUP BY student_name, dept_name HAVING COUNT(*) > 1;


Select dept_name,min(mark),max(mark),avg(mark) from student group by dept_name


--MYSQL Maria DB
	SELECT *
FROM table1
WHERE col1 IN 
(SELECT col1 from table2)
--SQL Server/Postgres SQL/Oracle
	SELECT * FROM table1
INTERSECT
SELECT * FROM table2


--MySQL/ Maria db	
Select now()
--SQL Server	
SELECT getdate();
--Oracle	
SELECT SYSDATE FROM DUAL;
--Postgres	
SELECT LOCALTIMESTAMP ;


Select * from table1 where exists (select * from table2 where table1.id=table2.id)


SELECT * FROM table1 WHERE MOD (id, 2) <> 0;

SELECT TOP 1 col1
FROM (
      SELECT DISTINCT TOP N col1
      FROM table1
      ORDER BY col1 DESC
      )
ORDER BY col1 ASC;

SELECT col1
FROM table1
ORDER BY col1 DESC LIMIT N-1,1;

select country_code,
DECODE (country_code,'UK', ‘United kingdom’,'USA', ‘United states’)
FROM country;

select country_code
, CASE (WHEN country_code ='UK' then ‘United kingdom’
WHEN country_code ='USA' then 'United states'
ELSE ’NOTHING’) END
FROM country;

MERGE INTO table t1
    USING (SELECT * FROM table2 t2 where t2.id> 100) h
    ON (t1.id = t2.emp_id)
  WHEN MATCHED THEN
    UPDATE SET t1.column2 = t1.column2
  WHEN NOT MATCHED THEN
    INSERT (id, column2)
    VALUES (t2.id,t2.column2);


