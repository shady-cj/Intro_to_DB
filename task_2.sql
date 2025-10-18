USE alx_book_store;
CREATE TABLE IF NOT EXISTS authors (

	author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL

);

CREATE TABLE IF NOT EXISTS books (
	book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    
    CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES authors(author_id)
);


CREATE TABLE IF NOT EXISTS customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);


CREATE TABLE IF NOT EXISTS orders (
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    
    CONSTRAINT fk_customer_orders FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE IF NOT EXISTS order_details (
	order_detail_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE,
    
    CONSTRAINT fk_order_order_details FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_book_order_details FOREIGN KEY (book_id) REFERENCES books(book_id)
    
);
