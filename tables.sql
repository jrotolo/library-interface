CREATE TABLE Rentals(
	rental_id int NOT NULL,
	user_id int NOT NULL,
	book_id int NOT NULL,
	fee_id int,
	due_date timestamp(8),
	checkout_date timestamp(8),
	active tinyint(1),
	PRIMARY KEY (rental_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id),
	FOREIGN KEY (book_id) REFERENCES Books(book_id),
	FOREIGN KEY (fee_id) REFERENCES Fees(fee_id) );

CREATE TABLE Books(
	book_id int NOT NULL,
	title varchar(100),
	publish_date timestamp(8),
	author_id int NOT NULL,
	publisher_id int NOT NULL,
	PRIMARY KEY (book_id),
	FOREIGN KEY (author_id) REFERENCES Authors(author_id),
	FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id));

CREATE TABLE Publishers(
	publisher_id int NOT NULL,
	name varchar(30),
	PRIMARY KEY (publisher_id) );

create table Users (user_id int NOT NULL, 
	card_number varchar(255) NOT NULL, 
	name varchar(20) NOT NULL, 
	PRIMARY KEY(user_id, card_number));

create table Fees (fee_id int NOT NULL, 
	balance int NOT NULL, 
	PRIMARY KEY(fee_id));

create table Authors (author_id varchar(20) NOT NULL, 
	name varchar(20) NOT NULL, 
	PRIMARY KEY(author_id));
