--Create a database
--Examine database/tables
--Write very basic scripts

/* Query 1: Create database called college*/
CREATE DATABASE IF NOT EXISTS college;
USE college;

/* Query 2: Create table called Instructor*/
DROP TABLE IF EXISTS Instructor;
CREATE TABLE Instructor(
Employee_id INT,
Dept_code VARCHAR(10),
Office VARCHAR(10),
Degree VARCHAR(10)
) ENGINE = INNODB;

/* Query 3: Insert data values into Instructor table*/
INSERT INTO instructor VALUES('103','HIST','DRE 156','Ph.D.');
INSERT INTO instructor VALUES('104','ENG','DRE 102','MA');
INSERT INTO instructor VALUES('105','MATH','SCI 146','Ph.D.');
INSERT INTO instructor VALUES('110','BIOL','AAK 160','Ph.D.');
INSERT INTO instructor VALUES('114','STAT','SCI 215','Ph.D.');
INSERT INTO instructor VALUES('209','CIS','KLR 333','Ph.D.');

/* Query 4: Display names of tables of current database*/
SHOW TABLES; 

/* Query 5: Display structure of table*/
DESCRIBE Instructor; /*OR*/
DESC Instructor;

/* Query 6: Display all information from table*/
SELECT *
FROM Instructor;

/* Query 7: Display Employee_ID and Degree from Instructor table*/
SELECT employee_id, degree
FROM Instructor;
