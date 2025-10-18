USE alx_book_store;
CREATE TABLE IF NOT EXISTS Authors (

	author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL

);

CREATE TABLE IF NOT EXISTS Books (
	book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    
    CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


CREATE TABLE IF NOT EXISTS Customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);


CREATE TABLE IF NOT EXISTS Orders (
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    
    CONSTRAINT fk_customer_orders FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE IF NOT EXISTS Order_Details (
	order_detail_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE,
    
    CONSTRAINT fk_order_order_details FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT fk_book_order_details FOREIGN KEY (book_id) REFERENCES Books(book_id)
    
);
