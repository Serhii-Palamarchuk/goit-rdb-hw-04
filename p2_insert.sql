
USE LibraryManagement;
-- authors
INSERT INTO authors (author_name) VALUES
('Стівен Кінг'), ('Джоан Роулінг');

-- genres
INSERT INTO genres (genre_name) VALUES
('Хоррор'), ('Фентезі');

-- books
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
('Воно', 1986, 1, 1),
('Гаррі Поттер і філософський камінь', 1997, 2, 2);

-- users
INSERT INTO users (username, email) VALUES
('ivan_koval', 'ivan@example.com'),
('olena_petrova', 'olena@example.com');

-- borrowed_books
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2025-07-01', '2025-07-10'),
(2, 2, '2025-07-02', NULL);
