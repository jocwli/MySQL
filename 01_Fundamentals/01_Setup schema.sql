/*This querie is intended to create a database called Retailstore 
(Build schema, database and tables; load fake datasets)*/

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

/* create the tables for the database */
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
