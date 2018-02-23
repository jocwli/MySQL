--Create and modify (add/view/drop) tables
--Modify/delete column in existing table

/*Database used*/
USE technology;

/*Query 1: creating a table within the database*/
/* drop the tables */
DROP TABLE IF EXISTS device;

CREATE TABLE device(
serial_number INT(7) NOT NULL PRIMARY KEY, 
make VARCHAR(4) NOT NULL, 
model VARCHAR(20) NOT NULL, 
processor_type VARCHAR(15) NOT NULL, 
main_memory VARCHAR(10) NOT NULL, 
disk_size VARCHAR(10) NOT NULL) 
ENGINE=INNODB;

/*Query 2: Insert values into computer*/
INSERT INTO device VALUES(9881234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', '6.0 GBytes', '1.0 TBytes');
INSERT INTO device VALUES(9881245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', '6.0 GBytes', '1.0 TBytes');
INSERT INTO device VALUES(9881256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', '6.0 GBytes', '1.0 TBytes');
INSERT INTO device VALUES(9881267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', '6.0 GBytes', '1.0 TBytes');
INSERT INTO device VALUES(9881278, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', '6.0 GBytes', '1.0 TBytes');
INSERT INTO device VALUES(1234567, 'APPL', 'MacBook Pro 13 Inch', 'Intel i5-2400', '128 GBytes', '1.0 TBytes');
INSERT INTO device VALUES(1234432, 'APPL', 'MacBook Pro 15 Inch', 'Intel i5-2400', '256 GBytes', '1.0 TBytes');
INSERT INTO device VALUES(1239999, 'APPL', 'MacBook Pro 13 Inch', 'Intel i5-2400', '512 GBytes', '1.0 TBytes');

/* Query 3: Add a column into the table*/
ALTER TABLE device
ADD processor_speed INT(10) NOT NULL;

/* Query 4: Display all rows in the table */
SELECT *
FROM device;

/* Query 5: Display the column names and datatypes in the table */
DESCRIBE device;

/* Query 6: Remove the column from the table*/
ALTER TABLE device
DROP COLUMN processor_speed;

/* Query 7: Rename the table */
RENAME TABLE device TO device_bckup;

/* Query 8: Display all table names within database*/
SHOW TABLES;

/* Query 9: Drop/remove a table */
DROP TABLE device_bckup;
SHOW TABLES;

/* Query 10: Modify another table and add an email column */
ALTER TABLE Phones
ADD email_address VARCHAR(30) NOT NULL;

/* Query 11: Drop/remove the email column that was just added */
ALTER TABLE Phones
DROP COLUMN email_address;

/* Query 12: Review the column names and datatypes for the Phone table */
DESC Phone;
