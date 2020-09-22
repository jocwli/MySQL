/*This querie is intended to create a database called Retailstore 
(Build schema, database and tables; load fake datasets)*/

/*Setup schema*/
CREATE DATABASE IF NOT EXISTS Retailstore;
USE Retailstore;

/* drop the tables */
DROP TABLE IF EXISTS orderitems;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS vendor;
DROP TABLE IF EXISTS administrators;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS branch_staff;
DROP TABLE IF EXISTS computer_staff;
DROP TABLE IF EXISTS computer;

/*Query 1: CREATE data tables*/

/* create table: Category */
CREATE TABLE category (
    category_id INT(4) NOT NULL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
)  ENGINE=INNODB;

/* create table: Vendor */
CREATE TABLE vendor (
    Vendor_id INT NOT NULL AUTO_INCREMENT,
    company_name CHAR(100) NULL,
    contact_lname CHAR(25) NOT NULL,
    contact_fname CHAR(25) NOT NULL,
    address VARCHAR(35) NULL,
    city VARCHAR(35) NULL,
    state VARCHAR(2) NULL,
    zip VARCHAR(5) NULL,
    phone CHAR(12) NOT NULL,
    email VARCHAR(100) NULL,
    CONSTRAINT vendor_pk PRIMARY KEY (vendor_id)
) ENGINE=INNODB;

/* create table: Product */
CREATE TABLE product (
    product_id INT(4) NOT NULL PRIMARY KEY,
    category_id INT(4) NOT NULL,
    product_code VARCHAR(10) NOT NULL UNIQUE,
    product_name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    list_price DECIMAL(10 , 2 ) NOT NULL,
    discount_percent DECIMAL(10 , 2 ) NOT NULL DEFAULT 0.00,
    date_added DATETIME DEFAULT NULL,
    vendor_id INT(4),
    CONSTRAINT products_fk_category FOREIGN KEY (category_id) REFERENCES category (category_id),
    CONSTRAINT product_fk_vendor FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id)
) ENGINE=INNODB;

/*  create table: Store */
CREATE TABLE store (
    store_id VARCHAR(3) NOT NULL,
    store_zip CHAR(5) NOT NULL,
    region_id CHAR NOT NULL,
    region_name CHAR(25) NOT NULL,
    PRIMARY KEY (store_id));

/* create table: Employee */
CREATE TABLe employee (
    employee_id INT(4) NOT NULL,
    store_id VARCHAR(3) NOT NULL,
    first_name CHAR(25) NOT NULL,
    last_name CHAR(25) NOT NULL,
    phone CHAR(12) NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    salary DECIMAL(10 , 2 ) NOT NULL,
    mgr INT(4),
    CONSTRAINT employee_pk PRIMARY KEY (employee_id),
    CONSTRAINT employee_pk_store FOREIGN KEY (store_id) REFERENCES store(store_id)
) ENGINE=INNODB;

/* create table: Customer */
CREATE TABLE customer (
    customer_id INT(4) NOT NULL PRIMARY KEY,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(60) NOT NULL,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    shipping_address_id INT(5) DEFAULT NULL,
    billing_address_id INT(5) DEFAULT NULL);

/*  create table: Address */
CREATE TABLE address (
    address_id INT(4) NOT NULL PRIMARY KEY,
    customer_id INT(4) NOT NULL,
    line1 VARCHAR(60) NOT NULL,
    line2 VARCHAR(60) DEFAULT NULL,
    city VARCHAR(40) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    Phone VARCHAR(12) NOT NULL,
    CONSTRAINT addresses_fk_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
) ENGINE=INNODB;

/* create table: Orders */
CREATE TABLE orders (
    order_id INT(4) NOT NULL PRIMARY KEY,
    customer_id INT(4) NOT NULL,
    employee_id INT(4) NOT NULL,
    store_id VARCHAR(3) NOT NULL,
    order_date DATETIME NOT NULL,
    ship_amount DECIMAL(10 , 2 ) NOT NULL,
    tax_amount DECIMAL(10 , 2 ) NOT NULL,
    ship_date DATETIME DEFAULT NULL,
    ship_address_id INT(4) NOT NULL,
    card_type VARCHAR(50) NOT NULL,
    card_number CHAR(16) NOT NULL,
    card_expires CHAR(7) NOT NULL,
    billing_address_id INT NOT NULL,
    CONSTRAINT order_fk_customers FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT order_fk_employee FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
    CONSTRAINT store_fk_order FOREIGN KEY (store_id) REFERENCES store (store_id)
) ENGINE=INNODB;

/* create table: OrderItems */
CREATE TABLE orderitems(
    item_id INT(4) NOT NULL PRIMARY KEY,
    order_id INT(4) NOT NULL,
    product_id INT(4) NOT NULL,
    item_price DECIMAL(10 , 2 ) NOT NULL,
    discount_amount DECIMAL(10 , 2 ) NOT NULL,
    quantity INT(3) NOT NULL,
    CONSTRAINT items_fk_order FOREIGN KEY (order_id) REFERENCES orders (order_id),
    CONSTRAINT items_fk_products FOREIGN KEY (product_id) REFERENCES product (product_id)
) ENGINE=INNODB;

/*  create table: Adminstrators */
CREATE TABLE administrators (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    email_address VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
) ENGINE=INNODB;


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

/*Query 2: INSERT INTO all newly created tables*/
INSERT INTO staff VALUES(10001,'Johnson', 'Jack', '415-123-4567', 'Jack.Johnson@lib.com');
INSERT INTO staff VALUES(10002,'Clooney', 'George', '415-234-5678', 'George.Clooney@lib.com');
INSERT INTO staff VALUES(10004,'Bear', 'Teddy', '415-345-6789', 'Teddy.Bear@lib.com');
INSERT INTO staff VALUES(10005,'Orange', 'Apple', '415-456-7891', 'Apple.Orange@lib.com');
INSERT INTO staff VALUES(10006,'Netwon', 'Isaac', '415-567-8912', 'Isaac.Newton@lib.com');
INSERT INTO staff VALUES(10007,'Jill', 'Jack', '415-678-9123', 'Jack.Jill@lib.com');
INSERT INTO staff VALUES(10008,'Washington', 'George', '415-789-1234', 'George.Washinton.@lib.com');
INSERT INTO staff VALUES(10009,'Wang', 'Alexander', '415-123-9874', 'Alexander.Wang@lib.com');
INSERT INTO staff VALUES(10010,'Obama', 'Barak', '415-223-1645', 'Barak.Obama@lib.com');
INSERT INTO staff VALUES(10011,'Says', ' Simon', '415-253-8962', ' Simon.Says@lib.com');

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
