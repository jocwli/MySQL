/*
Create a database and tables
Create stored procedures to insert data
Upload external datasets
Examine data with basic syntax */

/* Query 1: Create database called college*/
CREATE DATABASE IF NOT EXISTS college;
USE college;

/* Query 2: Create table called Instructor*/
DROP TABLE IF EXISTS Instructor;
CREATE TABLE Instructor(
Employee_id INT,
Dept_code VARCHAR(10),
Office VARCHAR(10),
Degree VARCHAR(10),
Salary INT
) ENGINE = INNODB;

/* Query 3a: Insert data values into Instructor table*/
INSERT INTO instructor VALUES('103','HIST','DRE 156','PhD','75000');
INSERT INTO instructor VALUES('104','ENG','DRE 102','MA','75000');
INSERT INTO instructor VALUES('105','MATH','SCI 146','PhD','95000');
INSERT INTO instructor VALUES('110','BIO','AAK 160','PhD','75000');
INSERT INTO instructor VALUES('114','STAT','SCI 215','PhD','99000');
INSERT INTO instructor VALUES('209','PHY','KLR 333','PhD','100000');
INSERT INTO instructor VALUES('201','CIS','RMM 331','PhD','113000');
INSERT INTO instructor VALUES('202','CIS','RME 332','PhD','100000');
INSERT INTO instructor VALUES('203','CIS','RAW 333','PhD','105000');
INSERT INTO instructor VALUES('204','ART','RAC 334','PhD','66000');
INSERT INTO instructor VALUES('205','CIS','RIS 337','PhD','103000');
INSERT INTO instructor VALUES('205','BIO','VLS 337','MS','90000');

/* Query 3b: Or create stored procedures to Insert data values into Instructor table*/
/*DELIMITER //
CREATE PROCEDURE InsertDataset (
IN i_Employee_id INT,
IN i_Dept_code VARCHAR(10),
IN i_Office VARCHAR(10),
IN i_Degree VARCHAR(10)
)
BEGIN
INSERT INTO instructor(Employee_id, Dept_code, Office, Degree)
VALUES(i_Employee_id, i_Dept_code, i_Office, i_Degree);
END//
DELIMITER ;

CALL InsertDataset ('202','CIS','HJR 111','Ph.D.','143000');
*/

/*Read in external datasets - ensure file is in right directory*/
/*
LOAD DATA LOCAL INFILE "‎⁨instructor.csv" 
INTO TABLE college.instructor
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/

/* Query 4: Display names of tables within current database*/
SHOW TABLES;

/* Query 5: Display structure of table*/
DESCRIBE Instructor; /*OR*/
DESC Instructor;

/* Query 6: Display all from table*/
SELECT *
FROM Instructor;

/* Query 7: Display top 3 from table*/
SELECT *
FROM Instructor
LIMIT 3;

/* Query 8: Display select variables from table*/
SELECT employee_id, degree, salary
FROM Instructor
WHERE degree = "PhD";

/* Query 9: Display max salary by dept*/
SELECT dept_code, max(salary)
FROM Instructor
GROUP BY 1;

/* Query 10: Display average salary for each degree*/
SELECT degree, avg(salary)
FROM Instructor
GROUP BY 1;