CREATE DATABASE book_store;

-- Table author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
     author_name VARCHAR(255)
 );
 
-- Table publisher
 CREATE TABLE publisher (
     publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255)
    );
    
-- Table book_language
 CREATE TABLE book_language (
     language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50)
 );
 
-- Table book
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    isbn VARCHAR(20) UNIQUE,
    publication_date DATE,
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Table book_author
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Table country
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100)
);
-- Table addres
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Table address_status
CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Table customer
 CREATE TABLE customer (
   customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
   phone_number VARCHAR(20)
 );
 
-- Table customer_address
 CREATE TABLE customer_address (
      customer_id INT,
   address_id INT,
    address_status_id INT,
     PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
     FOREIGN KEY (address_id) REFERENCES address(address_id),
   FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
  );
-- Table shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100)
);

-- Table order_status
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Table customer_order
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    shipping_method_id INT,
    order_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Table order_line
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Table order_history
CREATE TABLE order_history (
   history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    order_status_id INT,
    change_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
   FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
 );

-- Inserting data into author table
INSERT INTO author (author_name) VALUES
('Ken Walibora'),
('J.K.Rowlings'),
('William Shakesphere');

-- Inserting data into publisher table
INSERT INTO publisher (publisher_name) VALUES
('Longhor'),
('Bloomsbury Publishing'),
('Simon & Schuster');

 -- Inserting data into book_language table
INSERT INTO book_language (language_name) VALUES
('Kiswahili'),
('Enlish'),
('Early English');

-- Inserting data into book table
INSERT INTO book (title, isbn, publication_date, publisher_id, language_id) VALUES
('Siku Njema', '978-0141439518', '1999-2-8', 1, 1),
('Haryy Potter', '978-0451524935', '1997-5-9', 2, 1),
('Romeo&Juliet', '978-0385121751', '1597-10-2', 3, 1);

 -- Inserting data into book_author table
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserting data into country table
INSERT INTO country (country_name) VALUES
('Kenya'),
('United Kingdom'),
('Rwanda');

 -- Inserting data into address table
INSERT INTO address (street, city, postal_code, country_id) VALUES
('Odinga Street', 'kisumu', '12345', 1),
('456 High St', 'London', '00974', 2),
('Kigali Street', 'Kigali', '25670', 3);

-- Inserting data into address_status table
INSERT INTO address_status (status_name) VALUES
('Current'),
('Old'),
('Temporary');

-- Inserting data into customer table
INSERT INTO customer (first_name, last_name, email, phone_number) VALUES
('Ruth', 'Achieng', 'ruth@gmail.com', '+2541345634'),
('Smith', 'Jayden', 'smith@gmail.com', '555-5678'),
('Israel', 'Mbonyi', 'israel@gmail.com', '+257456789');

-- Inserting data into customer_address table
INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

 -- Inserting data into shipping_method table
INSERT INTO shipping_method (method_name) VALUES
('Standard'),
('Express'),
('Overnight');

 -- Inserting data into order_status table
INSERT INTO order_status (status_name) VALUES
('Pending'),
('Shipped'),
('Delivered');

 -- Inserting data into cust_order table
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, order_status_id) VALUES
(1, '2023-10-15 10:00:00', 1, 1),
(2, '2025-11-20 11:00:00', 2, 2),
(3, '2024-9-26 12:00:00', 3, 3);

-- -- Inserting data into order_line table
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 1, 600.99),
(2, 2, 2, 650.50),
(3, 3, 1, 300.75);

 -- Inserting data into order_history table
INSERT INTO order_history (order_id, order_status_id, change_date) VALUES
(1, 2, '2023-10-15 10:30:00'),
(2, 3, '2025-11-20 11:30:00'),
(3, 3, '2024-9-26 12:30:00');
-- Creating users
CREATE USER 'Kelvin'@'localhost' IDENTIFIED BY '123';
CREATE USER 'Sandra'@'localhost' IDENTIFIED BY '5678';

-- Creating roles
CREATE ROLE 'manager';
CREATE ROLE 'receptionist';

-- Priviledges to roles
GRANT ALL PRIVILEGES ON bookstore.* TO 'manager';
GRANT SELECT, UPDATE, INSERT ON bookstore.* To 'receptionist';

-- Grant roles to users
GRANT 'manager' TO 'Kelvin'@'localhost';
GRANT 'receptionist' TO 'Sandra'@'localhost';

-- Identifying popular books
SELECT book.title, SUM(order_line.quantity) AS total_quantity_sold
FROM book
JOIN order_line ON book.book_id = order_line.book_id
GROUP BY book.title
ORDER  BY total_quantity_sold DESC;

-- Retriving Customer order and status

SELECT
    cust_order.order_id,
    customer.first_name,
    customer.last_name,
    cust_order.order_date,
    order_status.status_name AS order_status

FROM cust_order
JOIN customer ON cust_order.customer_id = customer.customer_id
JOIN  order_status ON cust_order.order_status_id = order_status.order_status_id;

-- adding a book
INSERT INTO book (title, isbn, publication_date, publisher_id, language_id)
VALUES
    ('Damu Nyeusi', '978-AAAA', '2023-01-01', 1, 1);

-- Retriving books published after a specific date
  SELECT title, publication_date
 FROM book
 WHERE publication_date >'2020-01-01';