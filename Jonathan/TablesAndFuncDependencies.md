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
+--------------+--------------+------+-----+-------------------+-------+<br />
| Field        | Type         | Null | Key | Default           | Extra +<br />
+--------------+--------------+------+-----+-------------------+-------+<br />
| book_id      | int(11)      | NO   | PRI | NULL              |       +<br />
| title        | varchar(100) | YES  |     | NULL              |       +<br />
| publish_date | timestamp    | NO   |     | CURRENT_TIMESTAMP |       +<br />
| author_id    | int(11)      | NO   | MUL | NULL              |       +<br />
| publisher_id | int(11)      | NO   | MUL | NULL              |       +<br />
+--------------+--------------+------+-----+-------------------+-------+<br />
</div>


## Users Table

The users table contains all the information for a library user.
Users rent many books through the rentals table.

##### Primary Key:

- user_id

##### Functional Dependencies:

- user_id -> name card_number

<div class='sql'>
+-------------+--------------+------+-----+---------+-------+<br />
| Field       | Type         | Null | Key | Default | Extra +<br />
+-------------+--------------+------+-----+---------+-------+<br />
| user_id     | int(11)      | NO   | PRI | NULL    |       +<br />
| card_number | varchar(255) | NO   | PRI | NULL    |       +<br />
| name        | varchar(20)  | NO   |     | NULL    |       +<br />
+-------------+--------------+------+-----+---------+-------+<br />
</div>


## Authors Table

The authors table contains data relating to an author.
Authors can write several book.

##### Primary Key:

- author_id

##### Functional Dependencies:

- author_id -> name

<div class='sql'>
+-----------+-------------+------+-----+---------+-------+<br />
| Field     | Type        | Null | Key | Default | Extra +<br />
+-----------+-------------+------+-----+---------+-------+<br />
| author_id | varchar(20) | NO   | PRI | NULL    |       +<br />
| name      | varchar(20) | NO   |     | NULL    |       +<br />
+-----------+-------------+------+-----+---------+-------+<br />
</div>


## Publishers Table

The publishers table contains data relating to a publisher.
Publishers can publish many books.

##### Primary Key:

- publisher_id

##### Functional Dependencies:

- publisher_id -> name

<div class='sql'>
+--------------+-------------+------+-----+---------+-------+<br />
| Field        | Type        | Null | Key | Default | Extra +<br />
+--------------+-------------+------+-----+---------+-------+<br />
| publisher_id | int(11)     | NO   | PRI | NULL    |       +<br />
| name         | varchar(30) | YES  |     | NULL    |       +<br />
+--------------+-------------+------+-----+---------+-------+<br />
</div>


## Fees Table

Fees represent a fee associated with a rental.

##### Primary Key:

- fee_id

<div class='sql'>
+---------+---------+------+-----+---------+-------+<br />
| Field   | Type    | Null | Key | Default | Extra +<br />
+---------+---------+------+-----+---------+-------+<br />
| fee_id  | int(11) | NO   | PRI | NULL    |       +<br />
| balance | int(11) | NO   |     | NULL    |       +<br />
+---------+---------+------+-----+---------+-------+<br />
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
+---------------+------------+------+-----+---------------------+-------+<br />
| Field         | Type       | Null | Key | Default             | Extra +<br />
+---------------+------------+------+-----+---------------------+-------+<br />
| rental_id     | int(11)    | NO   | PRI | NULL                |       +<br />
| user_id       | int(11)    | NO   | MUL | NULL                |       +<br />
| book_id       | int(11)    | NO   | MUL | NULL                |       +<br />
| fee_id        | int(11)    | YES  | MUL | NULL                |       +<br />
| due_date      | timestamp  | NO   |     | CURRENT_TIMESTAMP   |       +<br />
| checkout_date | timestamp  | NO   |     | 0000-00-00 00:00:00 |       +<br />
| active        | tinyint(1) | YES  |     | NULL                |       +<br />
+---------------+------------+------+-----+---------------------+-------+<br />
</div>