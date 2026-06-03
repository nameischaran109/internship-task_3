CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20),
    publication_year INT,
    author_id INT,
    FOREIGN KEY (author_id)
    REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Borrowings (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id)
    REFERENCES Members(member_id),
    FOREIGN KEY (book_id)
    REFERENCES Books(book_id)
);
INSERT INTO Authors VALUES
(1, 'J.K. Rowling'),
(2, 'George Orwell'),
(3, 'Dan Brown');

INSERT INTO Books VALUES
(1, 'Harry Potter', '9780747532699', 1997, 1),
(2, '1984', '9780451524935', 1949, 2),
(3, 'The Da Vinci Code', NULL, 2003, 3);

INSERT INTO Members VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', NULL);

INSERT INTO Borrowings VALUES
(1, 1, 1, '2025-08-01', '2025-08-15'),
(2, 2, 2, '2025-08-05', NULL);


UPDATE Members
SET email = 'jane@example.com'
WHERE member_id = 2;

UPDATE Books
SET publication_year = 2004
WHERE book_id = 3;


DELETE FROM Borrowings
WHERE borrow_id = 2;


SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrowings;

SELECT title, publication_year
FROM Books;

SELECT *
FROM Books
WHERE publication_year > 1950;

SELECT *
FROM Books
WHERE publication_year > 1950
AND author_id = 1;

SELECT *
FROM Members
WHERE member_name = 'John Doe'
OR member_name = 'Jane Smith';

SELECT *
FROM Books
WHERE title LIKE '%Harry%';

SELECT *
FROM Books
WHERE publication_year BETWEEN 1950 AND 2025;

SELECT *
FROM Books
ORDER BY publication_year ASC;

SELECT *
FROM Books
ORDER BY publication_year DESC;

SELECT *
FROM Books
LIMIT 2;

SELECT DISTINCT publication_year
FROM Books;

SELECT title AS Book_Title
FROM Books;