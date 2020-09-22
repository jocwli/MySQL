/*
These queries are used to retrieve information using various operators in the WHERE clause:
--IS NULL
--IS NOT NULL
--IN(list)
--NOT IN(list)
--BETWEEN expression1 AND expression2
--LIKE
--Wildcards, NOT, OR, AND 
--Comparison operators (=,<>,!=,>=,<=)
*/

/*Database used*/
USE bookstore;

/*QUERY 1: Display customer (last, first, and id) where the customer_id is between 20000 and 60000*/
SELECT last_name, first_name, customer_id
FROM Customer
WHERE customer_id BETWEEN 20000 AND 60000;
 
/*QUERY 2: Display all employees who do not earn exactly 3000, 3200, or 3800 and who have a last name that begins with the letter 'S'*/
SELECT first_name, last_name, salary
FROM Employee
WHERE salary NOT IN(3000,3200,3800) and last_name LIKE "S%";
 
/*QUERY 3: Display orders from the Orders table where the ship_date contains a null value*/
SELECT order_id, order_date, ship_date
FROM Orders
WHERE ship_date IS NULL;
 
/*QUERY 4: Display customers whose last name contains "HA"*/
SELECT last_name, first_name
FROM Customer
WHERE last_name LIKE "%HA%"
ORDER BY first_name DESC;
 
/*QUERY 5: Display products where price is greater than $30 and less than $100*/
SELECT product_id, product_name, list_price
FROM Product
WHERE list_price BETWEEN 30.00 AND 100.00;
 
/*QUERY 6a: Display orders from order table where the orders are for the month of March only*/
/*Range Operator*/
SELECT order_id, order_date
FROM Orders
WHERE CONVERT(order_date, char(20)) BETWEEN "2018-03-01%" AND "2018-03-31%"
ORDER BY order_date DESC;

 /*QUERY 6b: Using Logical Operator for where the orders are during the month of March*/
SELECT order_id, order_date
FROM Orders
WHERE CONVERT(order_date, char(20)) > "2018-03-01%" AND CONVERT(order_date, char(20)) <= "2018-03-31%" 
ORDER BY order_date DESC;
 
 /*QUERY 6c: Search Pattern for where the orders are during the month of March*/
SELECT order_id, order_date
FROM Orders
WHERE CONVERT(order_date, char(20)) LIKE "2018-03-__%"
ORDER BY order_date DESC;
 
/*QUERY 7: Display orders from the orders table where orders shipped after Jan 10th 2018*/
SELECT order_id, ship_date
FROM Orders
WHERE ship_date > "2018-01-10%";
 
/*QUERY 8: Display orders from the orders table where orders placed on before or after Feb 28th 2018*/
SELECT order_id, order_date
FROM Orders
WHERE order_date <= "2018-02-28%";
 
/*QUERY 9: Display the products where the product name contains E in the second letter and L in the fourth letter*/
SELECT product_id, product_code, product_name
FROM Product
WHERE product_name LIKE "_E_L%"
ORDER BY product_code DESC;
 
/*QUERY 10: Display the products in category 10 or 20, with vendor_id in 1 or 2, and with a list price less than $1000*/
SELECT product_id, category_id, vendor_id, list_price
FROM Product
WHERE category_id IN(10,20) AND vendor_id IN(1,2) AND list_price <1000;
 
/*QUERY 11: Display all orders that have not shipped for at least 3 days*/
SELECT *
FROM Orders
WHERE DATEDIFF(order_date, ship_date) <=3;
 
/*QUERY 12: Display all orders that have shipped*/
SELECT order_id, customer_id, order_date
FROM Orders
WHERE ship_date IS NOT NULL;
