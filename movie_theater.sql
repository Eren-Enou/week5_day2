CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(100),
	loyalty_member BOOLEAN DEFAULT FALSE
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	price NUMERIC(4,2),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	rating VARCHAR(10),
	genre VARCHAR(25)
);

CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY,
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

ALTER TABLE ticket 
ADD COLUMN movie_id INTEGER NOT NULL;

ALTER TABLE ticket 
ADD FOREIGN KEY(movie_id) REFERENCES movie(movie_id);
