/* Select the users with a fee balance greater than $1 */
SELECT user_id, sum(balance) AS total_balance, count(fee_id) AS fee_count
FROM Users NATURAL JOIN Rentals NATURAL JOIN Fees
GROUP BY user_id
HAVING sum(balance) > 100
ORDER BY total_balance DESC;

/*
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
*/

/* Select the users with books that are overdue */
SELECT user_id, name, count(rental_id) AS num_overdue_books
FROM Users NATURAL JOIN Rentals
WHERE active = 1 AND CURDATE() > due_date
GROUP BY user_id
ORDER BY num_overdue_books DESC;

/*
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
*/



/* Select users with a book checked out with author = "Alysson Stark" */
SELECT DISTINCT user_id, Users.name, book_id, title
FROM Users NATURAL JOIN  Rentals NATURAL JOIN Books JOIN Authors ON (Books.author_id = Authors.author_id)
WHERE Authors.name = 'Alysson Stark';

/*
+---------+----------------------+---------+-----------------------------------+
| user_id | name                 | book_id | title                             |
+---------+----------------------+---------+-----------------------------------+
|       3 | Miss Angelina Kertzm |      83 | Synergized uniform moderator      | 
|      10 | Ford Stoltenberg     |      81 | Advanced bi-directional framework | 
|      18 | Shanelle Dare        |      80 | Assimilated maximized firmware    | 
|      24 | Grant Borer          |      81 | Advanced bi-directional framework | 
|      25 | Madilyn Swaniawski   |      84 | Synergized secondary matrices     | 
+---------+----------------------+---------+-----------------------------------+
/*
