/* Change rental from active to inactive */
update Rental
	SET active = 0
	WHERE rental_id = 3;

/* Change book title */
update Books
	SET title = "Pygmalion"
	WHERE title = "Pigmalion"

/* Change user name */
update Users
	SET name = "John"
	WHERE name = "Jon"
