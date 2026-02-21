CREATE DATABASE IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

DROP TABLE IF EXISTS borrowed_books;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS authors; 

CREATE TABLE authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
	genre_id INT AUTO_INCREMENT PRIMARY KEY,
	genre_name VARCHAR(100)
);

CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  publication_year YEAR,
  author_id INT NOT NULL,
  genre_id INT NOT NULL,
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
  CONSTRAINT fk_books_genre
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY, 
	username VARCHAR(255), 
	email VARCHAR(255)
);
        
CREATE TABLE borrowed_books (
	borrow_id INT AUTO_INCREMENT PRIMARY KEY,
	borrow_date DATE, 
	return_date DATE, 
	book_id INT NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT fk_bbook_books
		FOREIGN KEY (book_id) REFERENCES books(book_id), 
	CONSTRAINT fk_bbook_users
		FOREIGN KEY (user_id) REFERENCES users(user_id)
);
    