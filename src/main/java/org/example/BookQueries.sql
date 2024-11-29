USE  bookstore;
CREATE VIEW total_author_book_value AS
SELECT
    CONCAT(a.first_name, ' ', a.last_name) AS name,
    TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) AS age,
    COUNT(DISTINCT b.isbn) AS book_title_count,
    SUM(b.price * i.amount) AS inventory_value
FROM
    author a
        JOIN
    book b ON a.id = b.author_id
        JOIN
    inventory i ON b.isbn = i.isbn
        JOIN
    bookstore s ON i.store_id = s.id
GROUP BY
    a.id;