DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE author (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        first_name VARCHAR(100) NOT NULL,
                        last_name VARCHAR(100) NOT NULL,
                        birth_date DATE
);

CREATE TABLE language (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          language_name VARCHAR(50) NOT NULL
);

CREATE TABLE book (
                      isbn VARCHAR(13) PRIMARY KEY,
                      title VARCHAR(255) NOT NULL,
                      price DECIMAL(10, 2) NOT NULL,
                      publication_date DATE,
                      author_id INT,
                      language_id INT,
                      FOREIGN KEY (author_id) REFERENCES author(id),
                      FOREIGN KEY (language_id) REFERENCES language(id)
);

CREATE TABLE bookstore (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           store_name VARCHAR(100) NOT NULL,
                           city VARCHAR(100) NOT NULL
);

CREATE TABLE inventory (
                           store_id INT,
                           isbn VARCHAR(13),
                           amount INT NOT NULL,
                           PRIMARY KEY (store_id, isbn),
                           FOREIGN KEY (store_id) REFERENCES bookstore(id),
                           FOREIGN KEY (isbn) REFERENCES book(isbn)
);

INSERT INTO author (first_name, last_name, birth_date) VALUES
                                                           ('J.K.', 'Rowling', '1965-07-31'),
                                                           ('George', 'Orwell', '1903-06-25');

INSERT INTO language (language_name) VALUES
                                         ('English'),
                                         ('Swedish');

INSERT INTO book (isbn, title, price, publication_date, author_id, language_id) VALUES
                                                                                    ('9780747532743', 'Harry Potter and the Philosopher\'s Stone', 199.99, '1997-06-26', 1, 1),
                                                                                    ('9780451524935', '1984', 99.99, '1949-06-08', 2, 1);

INSERT INTO bookstore (store_name, city) VALUES
                                             ('Book Haven', 'Stockholm'),
                                             ('Literary World', 'Gothenburg');

INSERT INTO inventory (store_id, isbn, amount) VALUES
                                                   (1, '9780747532743', 10),
                                                   (1, '9780451524935', 5),
                                                   (2, '9780747532743', 3),
                                                   (2, '9780451524935', 8);

CREATE USER 'developer'@'localhost' IDENTIFIED BY 'password_developer';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT ON bookstore.* TO 'developer'@'localhost';

CREATE USER 'webserver'@'localhost' IDENTIFIED BY 'password_webserver';
GRANT INSERT, UPDATE, DELETE, SELECT ON bookstore.* TO 'webserver'@'localhost';


FLUSH PRIVILEGES;

SHOW GRANTS FOR 'developer'@'localhost';
SHOW GRANTS FOR 'webserver'@'localhost';

