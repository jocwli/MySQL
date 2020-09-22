/*These queries are basic select statements intended to simply retrieve and/or calculate information*/

/*Query 1: Display the rows from the customer table whose customer ID is not equal to 99999. Show the customer last, first, and ID* /

SELECT last_name, first_name, customer_id
FROM Customer
WHERE customer_id <> 99999;

/* Query 2: Display the product name, description from Product table where category id is greater than 10. */
SELECT product_name, description
FROM Product
WHERE category_id > 10;

/* Query 3: Display customer last, first, id, and email where the customer_id is 50008*/
SELECT last_name, first_name, customer_id, email_address
FROM Customer
where customer_id = 50008;

/* Query 4: Find the total price, total discount, overall item total from orderitems table where the item total is greater than 1000*/
SELECT item_id, item_price, discount_amount, quantity, 
        item_price*quantity as price_total, 
        discount_amount*quantity as discount_total, 
        item_price-discount_amount as item_total
FROM OrderItems
WHERE (item_price-discount_amount) > 1000
ORDER BY (item_price-discount_amount) DESC;

/* Query 5: Display store regional information from the store table. */
SELECT store_id, region_id, region_name
FROM Store;

/* Query 6: Display customer email information from the customer table. */
SELECT customer_id, email_address
FROM Customer;

/* Query 7: Display the unique customer by customer id. */
SELECT DISTINCT customer_id
FROM Orders;

/* Query 8: Find the top 5 products with their discount amount and discount price from the product table and sort by descending. */
SELECT product_name, list_price, discount_percent, 
        list_price*(discount_percent/100) as discount_amount,
        list_price-(list_price*(discount_percent/100)) as discount_price
FROM Product
ORDER BY (List_price-(list_price*(discount_percent/100))) DESC
LIMIT 5;

/* Query 9: Create a mailing list based off the fields in the Address table. */
SELECT customer_id, line1, line2, CONCAT(city, ', ', state), zip_code
FROM Address;

/* Query 10: Create the full name of the customer. */
SELECT CONCAT(last_name, ', ', first_name) as full_name
FROM Customer;

/* Query 11: Display the product name and category it resides and reverse the column order. */
SELECT product_name, category_id
FROM Product;
SELECT category_id, product_name
FROM Product;

/* Query 12: Calculate a new list price given a price increase of 20%. */
SELECT product_name, list_price, 
list_price+(list_price*(20/100)) as new_list_price
FROM Product;
