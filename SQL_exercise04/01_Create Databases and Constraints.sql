--Creating relationable databases and tables
--Design integrity constraints

/*Query 1: Drop the tables*/
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS branch_staff;
DROP TABLE IF EXISTS computer_staff;
DROP TABLE IF EXISTS computer;

/* Create tables where: 
      Staff records are never deleted from database
      Computer's serial number never changes so there is no cascade
      Computer at end of life are deleted from the database      
*/

/*The relational model: one primary key must be defined for each table*/
CREATE TABLE staff(
staff_id INT(5) NOT NULL, 
lname VARCHAR(20) NOT NULL, 
fname VARCHAR(10) NOT NULL, 
phone CHAR(12) NOT NULL, 
email  VARCHAR(30) NOT NULL,
PRIMARY KEY (staff_id)) 
ENGINE=INNODB;

CREATE TABLE computer(
serial_number INT(5) NOT NULL, 
make VARCHAR(4) NOT NULL, 
model VARCHAR(18) NOT NULL, 
processor_type VARCHAR(13) NOT NULL, 
speed INT(4) NOT NULL,
main_memory CHAR(10) NOT NULL, 
disk_size CHAR(10) NOT NULL,
PRIMARY KEY (serial_number)) 
ENGINE=INNODB;

CREATE TABLE computer_staff(
serial_number INT(5) NOT NULL, 
staff_id INT(5) NOT NULL, 
date_assigned DATE NOT NULL,
CONSTRAINT comp_assign_pk PRIMARY KEY (serial_number, data_assigned),
CONSTRAINT comp_assign_computer_fk FOREIGN KEY (serial_number) REFERENCES computer(serial_number) ON UPDATE NO ACTION ON DELETE CASCADE,
CONSTRAINT comp_assign_staff_fk FOREIGN KEY(staff_id) REFERENCES staff(staff_id) ON UPDATE NO ACTION ON DELETE NO ACTION
) ENGINE=INNODB;

CREATE TABLE branch_staff(
branch_id INT(5) NOT NULL, 
staff_id INT(5) NOT NULL,
contact CHAR(12) NOT NULL,
PRIMARY KEY (branch_id, staff_id),
CONSTRAINT branchstaff_branch_id_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
CONSTRAINT branchstaff_staff_id_fk FOREIGN KEY (staff_id) REFERENCES staff(staff_id))
ENGINE=INNODB;

/*Query 2 - INSERT INTO all newly created tables*/
INSERT INTO staff VALUES(10001,'Johnson', 'Jack', '415-123-4567', 'Jack.Johnson@libray.com');
INSERT INTO staff VALUES(10002,'Clooney', 'George', '415-234-5678', 'George.Clooney@library.com');
INSERT INTO staff VALUES(10004,'Bear', 'Teddy', '415-345-6789', 'Teddy.Bear@library.com');
INSERT INTO staff VALUES(10005,'Orange', 'Apple', '415-456-7891', 'Apple.Orange@library.com');
INSERT INTO staff VALUES(10006,'Netwon', 'Isaac', '415-567-8912', 'Isaac.Newton@library.com');
INSERT INTO staff VALUES(10007,'Jill', 'Jack', '415-678-9123', 'Jack.Jill@library.com');
INSERT INTO staff VALUES(10008,'One', 'Washington', '415-789-1234', 'Washinton.One@library.com');
INSERT INTO staff VALUES(10009,'Wang', 'Alex', '415-123-9874', 'Alex.Wang@library.com');
INSERT INTO staff VALUES(10010,'Lexis', 'Ashley', '415-223-1645', 'Ashley.Lexis@library.com');
INSERT INTO staff VALUES(10011,'Says', ' Simon', '415-253-8962', ' Simon.Says@library.com');

INSERT INTO computer VALUES(9871234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00, '6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(9871245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00, '6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(9871256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00, '6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(9871267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00, '6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(9871278, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00, '6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(9871289, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00, '6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(6541001, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40, '8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(6541002, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40, '8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(6541003, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40, '8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(6541004, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40, '8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(6541005, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40, '8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(6541006, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40, '8.0 GBytes', '1.0 TBytes');

INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(9871256, 10006, '2018-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(9871267, 10001, '2018-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(9871278, 10002, '2018-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(9871289, 10004, '2018-09-21');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(6541001, 10005, '2018-10-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(6541002, 10007, '2018-10-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(6541003, 10008, '2018-10-21');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(6541004, 10009, '2018-10-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(9871234, 10011, '2018-11-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned) VALUES(9871245, 10010, '2018-11-14');

INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(91234, 10001, '510-123-4516');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(92345, 10010, '510-123-0000 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(93456, 10009, '510-444-9999');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(94567, 10008, '510-555-8888 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(94567, 10007, '510-666-7777 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(95678, 10010, '510-111-6666 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(96789, 10011, '510-222-5555 ');

/*Query 3*/
SELECT serial_number, model
FROM computer;

/*Query 4*/
ALTER TABLE books
ADD COLUMN date_added DATETIME;

DESC books;

/*Query 5*/
ALTER TABLE staff
MODIFY COLUMN lname VARCHAR(30) NOT NULL;
DESC staff;

/*Query 6*/
ALTER TABLE staff
ADD COLUMN salary DECIMAL(7,2);

/*Query 7*/
SHOW COLUMNS FROM computer_staff;

/*Query 8*/
ALTER TABLE books
DROP COLUMN date_added;

/*Query 9 - copy the structure and indexes but not data*/
CREATE TABLE books_archive
LIKE books;

SHOW TABLES FROM library;

/*Query 10*/
DROP TABLE books_archive;
SHOW TABLES FROM library;
