CREATE DATABASE book_library;
USE book_library;

CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
	middle_name VARCHAR(30),
	last_name VARCHAR(30) NOT NULL,
	born DATETIME NOT NULL,
	died DATETIME
);

INSERT INTO authors(id,first_name, middle_name, last_name, born, died) VALUES
	(1,'Agatha', 'Mary Clarissa','Christie', '1890-09-15', '1976-01-12'),
	(2,'William', NULL,'Shakespeare', '1564-04-26', '1616-04-23'),
	(3,'Danielle', 'Fernandes Dominique', 'Schuelein-Steel', '1947-07-14', NULL),
	(4,'Joanne', NULL,'Rowling' , '1965-07-31', NULL),
	(5,'Lev', 'Nikolayevich', 'Tolstoy', '1828-09-09', '1910-11-20'),
	(6,'Paulo', 'Coelho de', 'Souza', '1947-08-24', NULL),
	(7,'Stephen', 'Edwin', 'King', '1947-09-21', NULL),
	(8,'John', 'Ronald Reuel', 'Tolkien', '1892-01-03', '1973-09-02'),
	(9,'Erika', NULL, 'Mitchell', '1963-03-07', NULL);
	
CREATE TABLE books (
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	author_id INT NOT NULL,
	year_of_release date,
	cost DOUBLE NOT NULL,
	CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(id)
);

INSERT INTO books(author_id,title, year_of_release,cost) VALUES
	(1,'Unfinished Portrait', '1930-10-10', 15.99),
	(1,'The Mysterious Affair at Styles', '1920-10-10',17.99),
	(1,'The Big Four', '1927-10-10',14.99),
	(1,'The Murder at the Vicarage', '1930-10-10',13.99),
	(1,'The Mystery of the Blue Train', '1928-10-10',12.99),
	(2,'Julius Caesar', '1599-10-10',11.99),
	(2,'Timon of Athens', '1607-10-10',13.99),
	(2,'As You Like It', '1600-10-10',18.99),
	(2,'A Midsummer Night\'s Dream', '1595-10-10',15.99),
	(3,'Going Home', '1973-10-10',15.99),
	(3,'The Ring', '1980-10-10',14.99),
	(3,'Secrets', '1985-10-10',15.99),
	(3,'Message From Nam', '1990-10-10',13.99),
	(4,'Career of Evil', '2015-10-10',15.99),
	(4, 'Harry Potter and the Philosopher\'s Stone','1997-10-10',19.99),
	(4,'Harry Potter and the Chamber of Secrets','1998-10-10',19.99),
	(4,'Harry Potter and the Prisoner of Azkaban','1999-10-10',19.99),
	(4,'Harry Potter and the Goblet of Fire','2000-10-10',19.99),
	(4,'Harry Potter and the Order of the Phoenix','2003-10-10',19.99),
	(4,'Harry Potter and the Half-Blood Prince','2005-10-10',19.99),
	(4,'Harry Potter and the Deathly Hallows','2007-10-10',19.99),
	(4,'Harry Potter and the Deathly Hallows','2007-10-10',15.99),
	(5,'Anna Karenina','1877-10-10',15.99),
	(5,'War And Peace','1869-10-10',30),
	(5,'Boyhood','1854-10-10',15.99),
	(6,'By the River Piedra I Sat Down and Wept','1994-10-10',15.99),
	(6,'The Alchemist','1988-10-10',15.99),
	(6,'The Fifth Mountain','1996-10-10',15.99),
	(6,'The Zahir','2005-10-10',15.99),
	(7,'Rage','1977-10-10',13.99),
	(7,'The Dead Zone','1979-10-10',13.99),
	(7,'It','1986-10-10',13.99),
	(7,'It','1986-10-10',13.99),	
	(8,'The Hobbit','1937-10-10',20.99),	
	(8,'The Adventures of Tom Bombadil','1962-10-10',13.99),	
	(9,'Fifty Shades of Grey','2011-10-10',13.99),	
	(9,'Fifty Shades Darker','2012-10-10',13.99),	
	(9,'Fifty Shades Freed','2012-10-10',13.99);