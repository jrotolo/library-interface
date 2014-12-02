/* Change rental from active to inactive */
UPDATE Rentals
	SET active = 0
	WHERE rental_id = 3;

/* Change book title */
UPDATE Books
  SET title = "Pygmalion"
	WHERE title = "Pigmalion";

/* Change user name */
UPDATE Users
  SET name = "John Snow"
  WHERE name = "Jon Snow";

/* Update a fee's balance */
UPDATE Fees
  SET balance = 200
  WHERE fee_id = 15;

/* Change rental due date */
UPDATE Rentals
  SET due_date = TIMESTAMP '2015-01-01'
  WHERE rental_id = 10;