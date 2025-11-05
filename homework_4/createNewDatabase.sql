CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    genre VARCHAR(30)
);

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE borrowings (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);



INSERT INTO books VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Novel'),
(2, '1984', 'George Orwell', 'Dystopia'),
(3, 'Clean Code', 'Robert C. Martin', 'Programming'),
(4, 'The Little Prince', 'Antoine de Saint-Exupéry', 'Children');

INSERT INTO members VALUES
(1, 'Alice Johnson', 'alice@mail.com'),
(2, 'Bob Smith', 'bob@mail.com'),
(3, 'Charlie Brown', 'charlie@mail.com');

INSERT INTO borrowings VALUES
(1, 1, 2, '2025-01-10', '2025-01-15'),
(2, 2, 1, '2025-01-12', NULL),
(3, 1, 3, '2025-01-14', NULL);

SELECT m.name, b.title, br.borrow_date, br.return_date
FROM members m
INNER JOIN borrowings br ON m.member_id = br.member_id
INNER JOIN books b ON br.book_id = b.book_id;

SELECT m.name, b.title, br.borrow_date
FROM members m
LEFT JOIN borrowings br ON m.member_id = br.member_id
LEFT JOIN books b ON br.book_id = b.book_id;

SELECT b.title, m.name AS borrowed_by, br.borrow_date
FROM borrowings br
RIGHT JOIN books b ON br.book_id = b.book_id
LEFT JOIN members m ON br.member_id = m.member_id;
