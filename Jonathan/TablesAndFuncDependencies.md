<style>

div.sql
{
  font-family: Courier, "Courier New", monospace;
}

</style>

# Tables and Functional Dependencies

## Books Table

The books table contains all the data for an individual book.
Books have one author and one publisher.
Books are also rented by many users through the rentals table.

##### Primary Key:

- book_id

##### Foreign Keys:

- author_id
- publisher_id

<div class='sql'>
+--------------+--------------+------+-----+-------------------+-------+
| Field        | Type         | Null | Key | Default           | Extra +
+--------------+--------------+------+-----+-------------------+-------+
| book_id      | int(11)      | NO   | PRI | NULL              |       +
| title        | varchar(100) | YES  |     | NULL              |       +
| publish_date | timestamp    | NO   |     | CURRENT_TIMESTAMP |       +
| author_id    | int(11)      | NO   | MUL | NULL              |       +
| publisher_id | int(11)      | NO   | MUL | NULL              |       +
+--------------+--------------+------+-----+-------------------+-------+
</div>


## Users Table

The users table contains all the information for a library user.
Users rent many books through the rentals table.

##### Primary Key:

- user_id

##### Functional Dependencies:

- user_id -> name card_number

<div class='sql'>
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra +
+-------------+--------------+------+-----+---------+-------+
| user_id     | int(11)      | NO   | PRI | NULL    |       +
| card_number | varchar(255) | NO   | PRI | NULL    |       +
| name        | varchar(20)  | NO   |     | NULL    |       +
+-------------+--------------+------+-----+---------+-------+
</div>


## Authors Table

The authors table contains data relating to an author.
Authors can write several book.

##### Primary Key:

- author_id

##### Functional Dependencies:

- author_id -> name

<div class='sql'>
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra +
+-----------+-------------+------+-----+---------+-------+
| author_id | varchar(20) | NO   | PRI | NULL    |       +
| name      | varchar(20) | NO   |     | NULL    |       +
+-----------+-------------+------+-----+---------+-------+
</div>


## Publishers Table

The publishers table contains data relating to a publisher.
Publishers can publish many books.

##### Primary Key:

- publisher_id

##### Functional Dependencies:

- publisher_id -> name

<div class='sql'>
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra +
+--------------+-------------+------+-----+---------+-------+
| publisher_id | int(11)     | NO   | PRI | NULL    |       +
| name         | varchar(30) | YES  |     | NULL    |       +
+--------------+-------------+------+-----+---------+-------+
</div>


## Fees Table

Fees represent a fee associated with a rental.

##### Primary Key:

- fee_id

<div class='sql'>
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra +
+---------+---------+------+-----+---------+-------+
| fee_id  | int(11) | NO   | PRI | NULL    |       +
| balance | int(11) | NO   |     | NULL    |       +
+---------+---------+------+-----+---------+-------+
</div>


## Rental Table

The rental table represents the relationship between users, fees, and authors.
It is the result of a user renting a book.
A fee only exists if the book is overdue, or if the book has been returned but the fee has not been paid yet.

##### Primary Key:

- rental_id

##### Foreign Keys:

- user_id
- book_id
- fee_id

<div class='sql'>
+---------------+------------+------+-----+---------------------+-------+
| Field         | Type       | Null | Key | Default             | Extra +
+---------------+------------+------+-----+---------------------+-------+
| rental_id     | int(11)    | NO   | PRI | NULL                |       +
| user_id       | int(11)    | NO   | MUL | NULL                |       +
| book_id       | int(11)    | NO   | MUL | NULL                |       +
| fee_id        | int(11)    | YES  | MUL | NULL                |       +
| due_date      | timestamp  | NO   |     | CURRENT_TIMESTAMP   |       +
| checkout_date | timestamp  | NO   |     | 0000-00-00 00:00:00 |       +
| active        | tinyint(1) | YES  |     | NULL                |       +
+---------------+------------+------+-----+---------------------+-------+
</div>