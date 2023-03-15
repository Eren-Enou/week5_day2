-- DDL ( Data Definition Language) Statements

-- Syntax:
-- CREATE TABLE table_name( col_name DATA_TYPE, ...)
-- table_name -> all lowercase and singular form

CREATE TABLE customer(
	--column_name DATATYPE <CONSTRAINTS>
	customer_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	first_name VARCHAR(50) NOT NULL, -- NNOT NULL means that this COLUMN cannot be EMPTY 
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	address VARCHAR(100),
	loyalty_member BOOLEAN DEFAULT FALSE 
);

SELECT *
FROM customer;

-- To make any changes to the table onec it is created, us ethe ALTER statement
-- Add column to the table
--ALTER TABLE table_name_to_alter ADD COLUMN new_col_name DATATYPE
ALTER TABLE customer
ADD COLUMN username VARCHAR(25);

--Change the nme of a column
--ALTER TABLE table_name RENAME COLUMN, current_col_name TO new_col_name

ALTER TABLE customer 
RENAME COLUMN email TO email_address;

--Create Order Table with Foreign Key to Customer Table
CREATE TABLE "order"(
	order_id SERIAL PRIMARY KEY,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_shipped TIMESTAMP,
	customer_id INTEGER NOT NULL, -- CREATE COLUMN FIRST
	-- Add Foreign Key second
	--FOREIGN KEY(column_in_domestic_table) REFERENCES foreign_table_name(column_in_foreign_table)
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

SELECT *
FROM "order";

--Create ORder-Product Table (join table between the Order and Product tables - Many-to-Many relationship)
CREATE TABLE order_product(
	order_id INTEGER NOT NULL,
	FOREIGN KEY(order_id) REFERENCES "order"(order_id),
	product_id INTEGER NOT NULL
--	FOREIGN KEY(product_id) REFERENCES product(product_id)
);

--Create Product Table AND THEN alter order-product table to add foreign key
CREATE TABLE product(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50),
	description VARCHAR(200),
	price NUMERIC(5,2),
	quantity INTEGER	
);

ALTER TABLE order_product 
ADD FOREIGN KEY(product_id) REFERENCES product(product_id);

SELECT *
FROM product;

--RENAME a table
--ALTER TABLE table_name RENAME TO new_name
ALTER TABLE product 
RENAME TO item;

CREATE TABLE seller(
	seller_id SERIAL PRIMARY KEY,
	seller_name VARCHAR(50) NOT NULL,
	description VARCHAR(200),
	email VARCHAR(50),
	address VARCHAR(100)
);


ALTER TABLE item 
ADD COLUMN seller_id INTEGER NOT NULL;

ALTER TABLE item 
ADD FOREIGN KEY(seller_id) REFERENCES seller(seller_id);

CREATE TABLE test(
	test_id SERIAL PRIMARY KEY,
	col_1 INTEGER,
	col_2 BOOLEAN
);

--Drop a column
--ALTER TABLE table_name DROP COLUMN col_name;
-- BE VERY CAREFUL WITH DROP - NO  UNDOING
ALTER TABLE test
DROP COLUMN col_1;

SELECT * 
FROM test;

--Remove a table completely use DROP TABLE
DROP TABLE IF EXISTS test;