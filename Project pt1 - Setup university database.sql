/* Project_part1.sql
CS 155A, Spring 2018*/

/*Part 1 – Create the Database / Populate Relations */ 
DROP DATABASE University;
CREATE DATABASE University;
USE University;

DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS term;
DROP TABLE IF EXISTS section;
DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS major;
DROP TABLE IF EXISTS location;
 
CREATE TABLE Department (
dept_id INT(1) NOT NULL UNIQUE,
dept_name CHAR(20) NOT NULL,
budget INT(10) NOT NULL,
PRIMARY KEY(dept_id))
ENGINE=INNODB;
 
CREATE TABLE Course (
course_id VARCHAR(6) NOT NULL,
title CHAR(50) NOT NULL,
credits INT(1) NOT NULL,
dept_id INT(1) NOT NULL,
prerequisite CHAR(50),
PRIMARY KEY(course_id),
FOREIGN KEY (dept_id) REFERENCES Department(dept_id))
ENGINE= INNODB;
 
CREATE TABLE location (
room_id INT(2) NOT NULL UNIQUE,
building CHAR(10) NOT NULL,
room_no INT(3) NOT NULL,
capacity INT(2) NOT NULL,
room_type CHAR(1) NOT NULL,
room_description CHAR(10) NOT NULL,
PRIMARY KEY (room_id))
ENGINE = INNODB;
 
CREATE TABLE faculty (
faculty_id INT(5) NOT NULL UNIQUE,
name CHAR(20) NOT NULL,
room_id INT(2) NOT NULL,
dept_id INT(1),
salary DECIMAL(9,2) NOT NULL,
PRIMARY KEY (faculty_id),
FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
FOREIGN KEY (room_id) REFERENCES Location(room_id))
ENGINE= INNODB;
 
 CREATE TABLE student (
 student_id INT(5) NOT NULL UNIQUE,
 last_name CHAR(20) NOT NULL,
 first_name char(20) NOT NULL,
 street VARCHAR(50) NOT NULL,
 city CHAR(10) NOT NULL,
 state CHAR(2) NOT NULL,
 zip INT(5) NOT NULL,
 birth_date DATE NOT NULL,
 major_id INT(3) NOT NULL,
 phone CHAR(10) NOT NULL,
 student_type CHAR(5) NOT NULL,
 PRIMARY KEY (student_id))
 ENGINE = INNODB;
 
 CREATE TABLE term (
 term_id VARCHAR(4) NOT NULL UNIQUE,
 term_description VARCHAR(20) NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 PRIMARY KEY (term_id))
 ENGINE = INNODB;
 
CREATE TABLE section (
section_id INT(4) NOT NULL UNIQUE,
course_id VARCHAR(6) NOT NULL,
section_number INT(2) NOT NULL,
term_id VARCHAR(4) NOT NULL,
faculty_id INT(5),
day CHAR(2) NOT NULL,
max_count INT(2) NOT NULL,
start_time TIME NOT NULL,
end_time TIME NOT NULL,
room_id INT(2) NOT NULL,
PRIMARY KEY (section_id),
FOREIGN KEY (course_id) REFERENCES course (course_id),
FOREIGN KEY (faculty_id) REFERENCES faculty (faculty_id))
ENGINE = INNODB;
  
CREATE TABLE registration (
student_id INT(5) NOT NULL,
section_id INT(4) NOT NULL,
midterm_grade CHAR(1),
final_grade CHAR(1),
PRIMARY KEY (section_id,student_id))
ENGINE = INNODB;
 
CREATE TABLE major (
major_id INT(3) NOT NULL UNIQUE,
major_desc CHAR(30),
PRIMARY KEY (major_id))
ENGINE = INNODB;
 
 INSERT INTO Department
 VALUES (1, 'Computer Science', 90000), 
 (2, 'Telecommunications', 100000), 
 (3, 'Accounting', 85000),
 (4, 'Math and Science', 120000),
 (5, 'Liberal Arts', 800000),
 (6, 'English', 70000);
 
 INSERT INTO Course
 VALUES ('AC101', 'Accounting', 3, 3, 'EN100'), 
 ('CIS253', 'Database Systems', 3, 1, NULL), 
 ('AC265', 'Systems Analysis', 3, 3, 'CIS253'),
 ('EN100', 'Basic English', 0, 6, NULL),
 ('LA123', 'English Literature', 3, 5,'EN100'),
 ('MA150', 'College Algebra', 3, 4, 'EN100');
 
 INSERT INTO location
 VALUES (11, 'Gandhi', 101, 2, 'O', 'Office'),
(12, 'Gandhi', 103, 2, 'O', 'Office'),
(13, 'Kennedy', 202, 35, 'L', 'Lab'),
(14, 'Kennedy', 204, 50, 'L', 'Lab'),
(15, 'Nehru', 301, 50, 'C', 'Classroom'),
(16, 'Nehru', 309, 45, 'C', 'Classroom'),
(17, 'Gandhi', 105, 2, 'O', 'Office'), 
(18, 'Kennedy', 206, 40, 'L', 'Lab'),
(19, 'Kennedy', 210, 30, 'C','Classroom'),
(20, 'Gandhi', 107, 2,'O', 'Office'),
(21, 'Gandhi', 109, 2, 'O', 'Office');
 
 INSERT INTO faculty
 VALUES (63395, 'Jones', 11, 1, 94333.99), 
 (78699, 'Mobley', 11, 1, 59303.62),
 (96895, 'Williams', 20, 2, 11992.41),
 (79653, 'Vajpayee', 12, 2, 88791.45),
  (97302, 'Collins', 17, 3, 61387.56), 
  (57180, 'Sen', 12, 3, 32570.50), 
  (74420,'Rivera',21, 4, 89805.83),
  (35579, 'Chang', 17, 5, 108011.81),
  (98377, 'Brad',12, 6, 35570.50);
  
 INSERT INTO student
 VALUES (24746, 'Diaz', 'Jose', '1 Ford Avenue #7', 'Hill', 'NJ', 08863, '1993-02-12', 100, 9735551111, 'ugrad'),
 (79352, 'Tyler', 'Kee' , '12 Morris Avenue', 'Bronx', 'NY', 10468, '1994-03-18', 500, 7185552222, 'grad'),
 (76672, 'Miliko', 'Rajesh', '25 River Road #3', 'Edison', 'NJ', 08837, '1995-12-12', 400, 7325553333, 'ugrad'),
 (14182, 'Rickles', 'Alex', '100 Main Street', 'Iselin', 'NJ', 08838, '1990-10-20', 500, 7325554444, 'grad'), 
 (44985, 'Lee', 'Ho', '2845 First Lane', 'Hope', 'NY', 11373, '1995-10-28', 600, 2125555555, 'grad'),
 (96052, 'Holn', 'Amir', '213 Broadway', 'Clifton', 'NJ', 07222, '1994-07-07', 200, 2015556666, 'ugrad');
 
 
INSERT INTO term
VALUES ('FL16','Fall 2016', '2016-09-08', '2016-12-20'),
('FL17', 'Fall 2017', '2017-09-07', '2017-12-19'),
('SP16', 'Spring 2016', '2016-04-28', '2016-07-16'), 
('SP17', 'Spring 2017', '2017-03-27', '2017-07-15'),
('WN17', 'Winter 2017', '2017-01-05', '2017-04-18');
 
INSERT INTO section
 VALUES (1101, 'AC265', 01, 'WN17', 97302, 'MW',  30, '09:00', '10:30', 13), 
 (1102, 'CIS253', 01, 'WN17', 78699, 'TR', 40, '09:00', '10:30', 18),
 (1103, 'MA150', 02, 'WN17', 74420, 'F', 25, '09:00', '12:00', 15),
 (1104, 'AC101', 01, 'FL17', 57180, 'MW', 35, '10:30', '12:00', 16),
 (1205, 'AC265', 01, 'SP17', 97302, 'MW', 35, '09:00', '10:30', 14),
 (1206, 'AC265', 02, 'SP17', 97302, 'TR', 30, '09:00', '10:30', 18), 
 (1207, 'LA123', 05, 'SP17', NULL, 'MW', 30, '09:00', '10:30', 15),
 (1208, 'CIS253', 21, 'SP17', 78699, 'TR', 40, '09:00', '10:30', 14),
 (1209, 'CIS253', 11, 'FL16', 63395, 'MW', 40, '09:00', '10:30', 18), 
 (1210, 'CIS253', 31, 'FL17', 78699, 'F', 45, '09:00', '12:00', 19), 
 (1311, 'EN100', 01, 'FL17', 98377, 'MW', 50, '09:00', '10:30', 14);
 
INSERT INTO registration
VALUES (24746, 1102, 'B', 'B'), 
(24746, 1103, 'C', 'F'), 
(24746, 1104, 'B', 'A'),
(24746, 1207, NULL, NULL),
(79352, 1205, NULL, NULL),
(76672, 1102, 'F', 'D'),
(76672, 1103, 'A', 'A'),
(76672, 1206, 'B', 'C'),
 (76672, 1207, NULL, NULL),
 (76672, 1210, NULL, NULL),
 (14182, 1101, 'F', 'W'),
 (14182, 1104, 'D', 'D'),
 (14182, 1206, 'A', 'B'),
 (14182, 1311, 'A', 'A'),
 (44985, 1206, NULL, NULL),
 (44985, 1207, NULL, NULL),
 (44985, 1210, NULL, NULL), 
 (96052, 1208, NULL, NULL),
 (96052, 1209, NULL, NULL), 
 (96052, 1311, 'B', 'B'); 
 
INSERT INTO major
 VALUES (100, 'AAS-Accounting'),
 (200, 'AAS-Computer Science'),
 (300, 'AAS-Telecommunications'),
 (400, 'BS-Accounting'),
 (500, 'BS-Computer Science'),
 (600, 'BS-Telecommunications');

