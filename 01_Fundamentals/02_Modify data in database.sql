/*Modify and query data in database created*/

/* Query 1: Show the rows in the table to preview*/
SELECT serial_number, model
FROM computer;

/* Query 2: Add a column for data and time in your table*/
ALTER TABLE books
ADD COLUMN date_added DATETIME;

DESC books;

/* Query 3: Modify a column so that it can't store null values*/
ALTER TABLE staff
MODIFY COLUMN lname VARCHAR(30) NOT NULL;
DESC staff;

/* Query 4: Add a column with a decimal datatype*/
ALTER TABLE staff
ADD COLUMN salary DECIMAL(7,2);

/* Query 5: Display all columns/rows of a table*/
SHOW COLUMNS FROM computer_staff;

/* Query 6: Remove a column*/
ALTER TABLE books
DROP COLUMN date_added;

/* Query 7: Copy the structure and indexes but not data*/
CREATE TABLE books_archive
LIKE books;

SHOW TABLES FROM library;

/* Query 8: Remove a table from the database and display the names of all tables*/
DROP TABLE books_archive;
SHOW TABLES FROM library;
