/* Select the users with a fee balance greater than $1 */
SELECT user_id, sum(balance) AS total_balance, count(fee_id) AS fee_count
FROM Users NATURAL JOIN Rentals NATURAL JOIN Fees
GROUP BY user_id
HAVING sum(balance) > 100
ORDER BY total_balance DESC;

+---------+---------------+-----------+
| user_id | total_balance | fee_count |
+---------+---------------+-----------+
|      18 |          1987 |         6 | 
|      30 |          1490 |         5 | 
|      17 |          1448 |         5 | 
|      31 |          1389 |         4 | 
|      28 |          1257 |         5 | 
|       7 |          1250 |         4 | 
|      25 |          1144 |         5 | 
|       3 |          1141 |         4 | 
|      26 |          1032 |         3 | 
|      20 |          1029 |         3 | 
|      22 |           969 |         5 | 
|      33 |           944 |         3 | 
|      19 |           925 |         4 | 
|      16 |           901 |         2 | 
|      13 |           868 |         4 | 
|       4 |           809 |         2 | 
|      29 |           745 |         2 | 
|      10 |           732 |         4 | 
|       5 |           617 |         2 | 
|      14 |           503 |         2 | 
|      11 |           495 |         4 | 
|      12 |           491 |         1 | 
|      27 |           478 |         2 | 
|       9 |           402 |         1 | 
|      21 |           401 |         1 | 
|      35 |           390 |         1 | 
|      24 |           378 |         2 | 
|       6 |           291 |         1 | 
|      15 |           242 |         1 | 
|      32 |           231 |         1 | 
+---------+---------------+-----------+

/* Select the users with books that are overdue */
SELECT user_id, name, count(rental_id) AS num_overdue_books
FROM Users NATURAL JOIN Rentals
WHERE active = 1 AND CURDATE() > due_date
GROUP BY user_id
ORDER BY num_overdue_books DESC;

+---------+----------------------+-------------------+
| user_id | name                 | num_overdue_books |
+---------+----------------------+-------------------+
|      22 | Tommie Deckow V      |                 4 | 
|      25 | Madilyn Swaniawski   |                 4 | 
|      18 | Shanelle Dare        |                 4 | 
|      30 | Demetris Stiedemann  |                 3 | 
|      10 | Ford Stoltenberg     |                 3 | 
|      33 | Wilfred King V       |                 3 | 
|       3 | Miss Angelina Kertzm |                 3 | 
|      19 | Dean Turcotte        |                 3 | 
|      28 | Gladys Johnston      |                 3 | 
|      29 | Alec Dibbert         |                 2 | 
|      16 | Warren Toy           |                 2 | 
|       7 | Marcelino Bins       |                 2 | 
|      24 | Grant Borer          |                 2 | 
|      17 | Emma Mosciski        |                 2 | 
|      31 | Cleo Cassin          |                 2 | 
|      11 | Monty Gutmann        |                 2 | 
|      20 | Adela Ratke          |                 2 | 
|       5 | Mrs. Odessa Blanda   |                 2 | 
|      15 | Alvina Ryan          |                 1 | 
|       6 | Ashtyn Bruen         |                 1 | 
|      26 | Donavon Walsh DDS    |                 1 | 
|      35 | Zena Terry           |                 1 | 
|      12 | Dahlia Larkin V      |                 1 | 
|      27 | Brody Marks          |                 1 | 
|       4 | Lue Pfannerstill     |                 1 | 
|      14 | Mr. Declan Rosenbaum |                 1 | 
|      21 | Dorcas Bode          |                 1 | 
+---------+----------------------+-------------------+



/* Select users with a book checked out with author = "Alysson Stark" */
SELECT DISTINCT user_id, Users.name, book_id, title
FROM Users NATURAL JOIN  Rentals NATURAL JOIN Books JOIN Authors ON (Books.author_id = Authors.author_id)
WHERE Authors.name = 'Alysson Stark';

+---------+----------------------+---------+-----------------------------------+
| user_id | name                 | book_id | title                             |
+---------+----------------------+---------+-----------------------------------+
|       3 | Miss Angelina Kertzm |      83 | Synergized uniform moderator      | 
|      10 | Ford Stoltenberg     |      81 | Advanced bi-directional framework | 
|      18 | Shanelle Dare        |      80 | Assimilated maximized firmware    | 
|      24 | Grant Borer          |      81 | Advanced bi-directional framework | 
|      25 | Madilyn Swaniawski   |      84 | Synergized secondary matrices     | 
+---------+----------------------+---------+-----------------------------------+

/* Find all users who have a rental */
SELECT DISTINCT Users.user_id, Users.name
FROM Users NATURAL JOIN Rental;

+---------+----------------------+
| user_id | name                 |
+---------+----------------------+
|       1 | Reid Kuphal          |
|       3 | Miss Angelina Kertzm |
|       4 | Lue Pfannerstill     |
|       5 | Mrs. Odessa Blanda   |
|       6 | Ashtyn Bruen         |
|       7 | Marcelino Bins       |
|       9 | Delpha Wiza          |
|      10 | Ford Stoltenberg     |
|      11 | Monty Gutmann        |
|      12 | Dahlia Larkin V      |
|      13 | Lulu Olson           |
|      14 | Mr. Declan Rosenbaum |
|      15 | Alvina Ryan          |
|      16 | Warren Toy           |
|      17 | Emma Mosciski        |
|      18 | Shanelle Dare        |
|      19 | Dean Turcotte        |
|      20 | Adela Ratke          |
|      21 | Dorcas Bode          |
|      22 | Tommie Deckow V      |
|      24 | Grant Borer          |
|      25 | Madilyn Swaniawski   |
|      26 | Donavon Walsh DDS    |
|      27 | Brody Marks          |
|      28 | Gladys Johnston      |
|      29 | Alec Dibbert         |
|      30 | Demetris Stiedemann  |
|      31 | Cleo Cassin          |
|      32 | Melvina Schmeler     |
|      33 | Wilfred King V       |
|      35 | Zena Terry           |
+---------+----------------------+

/* Find all unique author and publisher pairs */
SELECT r1.author_id, Authors.name as author_name, r1.publisher_id, Publishers.name as publisher_name
FROM (SELECT DISTINCT author_id, publisher_id
FROM Books) as r1, Authors, Publishers
WHERE r1.author_id=Authors.author_id AND r1.publisher_id=Publishers.publisher_id;

+-----------+----------------------+--------------+--------------------------------+
| author_id | author_name          | publisher_id | publisher_name                 |
+-----------+----------------------+--------------+--------------------------------+
|         2 | Breanne Murazik      |            7 | Vandervort, Ferry and Moore    |
|         2 | Breanne Murazik      |            5 | Klein Press                    |
|         2 | Breanne Murazik      |            9 | Torp-Reichert                  |
|         2 | Breanne Murazik      |           10 | Wisozk Printers                |
|         3 | Miss Monica Klein    |            3 | Dickens-Stehr                  |
|         3 | Miss Monica Klein    |            7 | Vandervort, Ferry and Moore    |
|         3 | Miss Monica Klein    |           10 | Wisozk Printers                |
|         3 | Miss Monica Klein    |            9 | Torp-Reichert                  |
|         5 | Shyanne Jacobs       |            1 | Weber-Halvorson                |
|         5 | Shyanne Jacobs       |            7 | Vandervort, Ferry and Moore    |
|         5 | Shyanne Jacobs       |            5 | Klein Press                    |
|         6 | Reuben Kunze         |            9 | Torp-Reichert                  |
|         6 | Reuben Kunze         |            3 | Dickens-Stehr                  |
|         6 | Reuben Kunze         |           10 | Wisozk Printers                |
|         6 | Reuben Kunze         |            5 | Klein Press                    |
|         6 | Reuben Kunze         |            6 | Berge Press                    |
|         7 | Christopher Hirthe   |            7 | Vandervort, Ferry and Moore    |
|         9 | Miss Isabella Legros |            6 | Berge Press                    |
|         9 | Miss Isabella Legros |            7 | Vandervort, Ferry and Moore    |
|         9 | Miss Isabella Legros |            9 | Torp-Reichert                  |
|         9 | Miss Isabella Legros |            1 | Weber-Halvorson                |
|         9 | Miss Isabella Legros |            4 | Parker-Cormier                 |
|         9 | Miss Isabella Legros |            3 | Dickens-Stehr                  |
|        10 | Kaya Kunze Jr.       |            4 | Parker-Cormier                 |
|        10 | Kaya Kunze Jr.       |            1 | Weber-Halvorson                |
|        10 | Kaya Kunze Jr.       |            9 | Torp-Reichert                  |
|        10 | Kaya Kunze Jr.       |            8 | Lemke-Vandervort               |
|        10 | Kaya Kunze Jr.       |            7 | Vandervort, Ferry and Moore    |
|        10 | Kaya Kunze Jr.       |            6 | Berge Press                    |
|        11 | Sigrid Herzog IV     |            5 | Klein Press                    |
|        11 | Sigrid Herzog IV     |            8 | Lemke-Vandervort               |
|        11 | Sigrid Herzog IV     |            4 | Parker-Cormier                 |
|        12 | Jannie Emard         |            2 | Schowalter, Ernser and Koelpin |
|        12 | Jannie Emard         |            4 | Parker-Cormier                 |
|        12 | Jannie Emard         |           10 | Wisozk Printers                |
|        12 | Jannie Emard         |            6 | Berge Press                    |
|        12 | Jannie Emard         |            5 | Klein Press                    |
|        14 | Mossie Langworth     |            1 | Weber-Halvorson                |
|        14 | Mossie Langworth     |            4 | Parker-Cormier                 |
|        14 | Mossie Langworth     |           10 | Wisozk Printers                |
|        14 | Mossie Langworth     |            3 | Dickens-Stehr                  |
|        14 | Mossie Langworth     |            6 | Berge Press                    |
|        15 | Izabella Bartell I   |            4 | Parker-Cormier                 |
|        15 | Izabella Bartell I   |            5 | Klein Press                    |
|        15 | Izabella Bartell I   |            7 | Vandervort, Ferry and Moore    |
|        15 | Izabella Bartell I   |            9 | Torp-Reichert                  |
|        16 | Verlie Haag          |            1 | Weber-Halvorson                |
|        17 | Hallie Wiegand       |            2 | Schowalter, Ernser and Koelpin |
|        17 | Hallie Wiegand       |            8 | Lemke-Vandervort               |
|        17 | Hallie Wiegand       |            6 | Berge Press                    |
|        17 | Hallie Wiegand       |            9 | Torp-Reichert                  |
|        19 | Roderick Eichmann Sr |            4 | Parker-Cormier                 |
|        19 | Roderick Eichmann Sr |            7 | Vandervort, Ferry and Moore    |
|        21 | Adelbert Corwin      |            3 | Dickens-Stehr                  |
|        21 | Adelbert Corwin      |            7 | Vandervort, Ferry and Moore    |
|        21 | Adelbert Corwin      |            2 | Schowalter, Ernser and Koelpin |
|        21 | Adelbert Corwin      |           10 | Wisozk Printers                |
|        21 | Adelbert Corwin      |            6 | Berge Press                    |
|        22 | Alysson Stark        |            9 | Torp-Reichert                  |
|        22 | Alysson Stark        |            2 | Schowalter, Ernser and Koelpin |
|        22 | Alysson Stark        |            4 | Parker-Cormier                 |
|        23 | Julian Wyman         |            6 | Berge Press                    |
|        23 | Julian Wyman         |            4 | Parker-Cormier                 |
|        23 | Julian Wyman         |            5 | Klein Press                    |
|        24 | Ms. Bethany Sawayn   |            7 | Vandervort, Ferry and Moore    |
|        24 | Ms. Bethany Sawayn   |            9 | Torp-Reichert                  |
|        25 | Mrs. Kody Kohler     |            3 | Dickens-Stehr                  |
|        25 | Mrs. Kody Kohler     |            8 | Lemke-Vandervort               |
|        25 | Mrs. Kody Kohler     |            7 | Vandervort, Ferry and Moore    |
+-----------+----------------------+--------------+--------------------------------+


/* Find all users who have checked out a book in the past n days */
SELECT user_id, book_id, checkout_date 
FROM Rentals 
WHERE datediff(curdate(), checkout_date) <= 7;

+---------+---------+---------------------+
| user_id | book_id | checkout_date       |
+---------+---------+---------------------+
|       3 |      58 | 2014-11-30 00:00:00 |
|      16 |      10 | 2014-11-28 00:00:00 |
|      18 |      87 | 2014-11-28 00:00:00 |
|      26 |      22 | 2014-11-25 00:00:00 |
+---------+---------+---------------------+

/* Select users with more than 0 fees in order from most fees to least fees */
SELECT user_id, name, COUNT(fee_id) AS fee_count
FROM Users NATURAL JOIN Rentals
GROUP BY user_id
HAVING COUNT(fee_id) > 0
ORDER BY fee_count DESC;

+---------+----------------------+---------------+
| user_id | name                 | COUNT(fee_id) |
+---------+----------------------+---------------+
|       3 | Miss Angelina Kertzm |             4 | 
|       4 | Lue Pfannerstill     |             2 | 
|       5 | Mrs. Odessa Blanda   |             2 | 
|       6 | Ashtyn Bruen         |             1 | 
|       7 | Marcelino Bins       |             4 | 
|       9 | Delpha Wiza          |             1 | 
|      10 | Ford Stoltenberg     |             4 | 
|      11 | Monty Gutmann        |             4 | 
|      12 | Dahlia Larkin V      |             1 | 
|      13 | Lulu Olson           |             4 | 
|      14 | Mr. Declan Rosenbaum |             2 | 
|      15 | Alvina Ryan          |             1 | 
|      16 | Warren Toy           |             2 | 
|      17 | Emma Mosciski        |             5 | 
|      18 | Shanelle Dare        |             6 | 
|      19 | Dean Turcotte        |             4 | 
|      20 | Adela Ratke          |             3 | 
|      21 | Dorcas Bode          |             1 | 
|      22 | Tommie Deckow V      |             5 | 
|      24 | Grant Borer          |             2 | 
|      25 | Madilyn Swaniawski   |             5 | 
|      26 | Donavon Walsh DDS    |             3 | 
|      27 | Brody Marks          |             2 | 
|      28 | Gladys Johnston      |             5 | 
|      29 | Alec Dibbert         |             2 | 
|      30 | Demetris Stiedemann  |             5 | 
|      31 | Cleo Cassin          |             4 | 
|      32 | Melvina Schmeler     |             1 | 
|      33 | Wilfred King V       |             3 | 
|      35 | Zena Terry           |             1 | 
+---------+----------------------+---------------+

/* Users the have checked out at least 5 books */
SELECT user_id, name, COUNT(book_id) AS books_rented
FROM Books NATURAL JOIN Rentals NATURAL JOIN Users
GROUP BY user_id
HAVING COUNT(book_id) >= 5
ORDER BY books_rented DESC;

+---------+----------------------+--------------+
| user_id | name                 | books_rented |
+---------+----------------------+--------------+
|      22 | Tommie Deckow V      |           10 | 
|      17 | Emma Mosciski        |           10 | 
|      18 | Shanelle Dare        |           10 | 
|      25 | Madilyn Swaniawski   |           10 | 
|      20 | Adela Ratke          |           10 | 
|       4 | Lue Pfannerstill     |            9 | 
|      28 | Gladys Johnston      |            9 | 
|      16 | Warren Toy           |            8 | 
|       6 | Ashtyn Bruen         |            8 | 
|      30 | Demetris Stiedemann  |            8 | 
|       7 | Marcelino Bins       |            8 | 
|      19 | Dean Turcotte        |            8 | 
|      26 | Donavon Walsh DDS    |            8 | 
|       3 | Miss Angelina Kertzm |            8 | 
|       5 | Mrs. Odessa Blanda   |            7 | 
|      31 | Cleo Cassin          |            7 | 
|      10 | Ford Stoltenberg     |            7 | 
|      27 | Brody Marks          |            7 | 
|      11 | Monty Gutmann        |            6 | 
|      35 | Zena Terry           |            6 | 
|      14 | Mr. Declan Rosenbaum |            6 | 
|      15 | Alvina Ryan          |            6 | 
|      21 | Dorcas Bode          |            5 | 
|      29 | Alec Dibbert         |            5 | 
|      24 | Grant Borer          |            5 | 
|      13 | Lulu Olson           |            5 | 
+---------+----------------------+--------------+

/* Users that have checked out at more than 1 book by the same author */
SELECT user_id, Users.name AS user_name, Authors.name as author_name, COUNT(book_id) AS books_rented
FROM Books NATURAL JOIN Rentals NATURAL JOIN Users JOIN Authors ON (Books.author_id = Authors.author_id)
GROUP BY user_id, Authors.author_id
HAVING COUNT(book_id) > 1
ORDER BY books_rented DESC;

+---------+----------------------+----------------------+--------------+
| user_id | user_name            | author_name          | books_rented |
+---------+----------------------+----------------------+--------------+
|       6 | Ashtyn Bruen         | Mossie Langworth     |            4 | 
|      22 | Tommie Deckow V      | Miss Isabella Legros |            3 | 
|      28 | Gladys Johnston      | Kaya Kunze Jr.       |            3 | 
|      16 | Warren Toy           | Mrs. Kody Kohler     |            3 | 
|      27 | Brody Marks          | Kaya Kunze Jr.       |            3 | 
|      18 | Shanelle Dare        | Jannie Emard         |            2 | 
|      21 | Dorcas Bode          | Mossie Langworth     |            2 | 
|      15 | Alvina Ryan          | Ms. Bethany Sawayn   |            2 | 
|      26 | Donavon Walsh DDS    | Reuben Kunze         |            2 | 
|       4 | Lue Pfannerstill     | Izabella Bartell I   |            2 | 
|       4 | Lue Pfannerstill     | Mrs. Kody Kohler     |            2 | 
|      13 | Lulu Olson           | Mrs. Kody Kohler     |            2 | 
|      18 | Shanelle Dare        | Mrs. Kody Kohler     |            2 | 
|      11 | Monty Gutmann        | Miss Isabella Legros |            2 | 
|      14 | Mr. Declan Rosenbaum | Jannie Emard         |            2 | 
|      25 | Madilyn Swaniawski   | Julian Wyman         |            2 | 
|       5 | Mrs. Odessa Blanda   | Reuben Kunze         |            2 | 
|      30 | Demetris Stiedemann  | Julian Wyman         |            2 | 
|      31 | Cleo Cassin          | Mossie Langworth     |            2 | 
|      35 | Zena Terry           | Mossie Langworth     |            2 | 
|      10 | Ford Stoltenberg     | Izabella Bartell I   |            2 | 
|      26 | Donavon Walsh DDS    | Adelbert Corwin      |            2 | 
|      17 | Emma Mosciski        | Miss Isabella Legros |            2 | 
|      20 | Adela Ratke          | Miss Isabella Legros |            2 | 
|      20 | Adela Ratke          | Roderick Eichmann Sr |            2 | 
|      20 | Adela Ratke          | Kaya Kunze Jr.       |            2 | 
|       3 | Miss Angelina Kertzm | Mrs. Kody Kohler     |            2 | 
|      29 | Alec Dibbert         | Reuben Kunze         |            2 | 
|      24 | Grant Borer          | Adelbert Corwin      |            2 | 
|       7 | Marcelino Bins       | Mrs. Kody Kohler     |            2 | 
+---------+----------------------+----------------------+--------------+

/* Books that have never been rented */
SELECT book_id, title, name AS author
FROM Books NATURAL JOIN Authors
WHERE book_id NOT IN
  (SELECT book_id FROM Books NATURAL JOIN Rentals);
  
+---------+------------------------------------------+----------------------+
| book_id | title                                    | author               |
+---------+------------------------------------------+----------------------+
|       3 | Digitized systematic project             | Breanne Murazik      | 
|       8 | De-engineered multi-state infrastructure | Miss Monica Klein    | 
|      12 | Down-sized 5th generation flexibility    | Miss Monica Klein    | 
|      24 | Triple-buffered exuding parallelism      | Miss Isabella Legros | 
|      41 | Innovative user-facing emulation         | Sigrid Herzog IV     | 
|      44 | Persistent mission-critical migration    | Jannie Emard         | 
|      49 | Function-based systemic model            | Mossie Langworth     | 
|      54 | Front-line contextually-based ability    | Mossie Langworth     | 
|      59 | Profound methodical parallelism          | Izabella Bartell I   | 
|      71 | Persevering client-driven application    | Roderick Eichmann Sr | 
|      82 | Face to face modular structure           | Alysson Stark        | 
+---------+------------------------------------------+----------------------+

/* Authors Tommie Deckow V (user_id = 22) has rented a book by */
SELECT DISTINCT Authors.author_id, Authors.name
FROM Authors JOIN Books ON (Books.author_id = Authors.author_id) NATURAL JOIN Rentals JOIN Users ON (Rentals.user_id = Users.user_id)
WHERE Users.user_id = 22;

+-----------+----------------------+
| author_id | name                 |
+-----------+----------------------+
| 3         | Miss Monica Klein    | 
| 5         | Shyanne Jacobs       | 
| 9         | Miss Isabella Legros | 
| 10        | Kaya Kunze Jr.       | 
| 15        | Izabella Bartell I   | 
| 19        | Roderick Eichmann Sr | 
| 21        | Adelbert Corwin      | 
| 25        | Mrs. Kody Kohler     | 
+-----------+----------------------+
