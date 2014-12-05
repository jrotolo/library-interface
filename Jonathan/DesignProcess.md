# Design Process

We followed a 4 step design process for creating the library database.
Each of the subprocesses is listed and outlined with more detail below

## Collect User Requirements

The first thing we did was collect user requirements.
We asked potential users what sort of functions they would expect a library databse to perform.
Then we focused on how they would expect those functions to be performed from a user's perspective.

During the interviews we paid attention to what sort of data the user would want the database to store.
Additionally, we tried to focus on what sort of operations the user would expect the database to perform.

More information about user requirements can be found in the Constraints and Assumptions and the Application Domain sections.

## Conceptual Design

The second step in the design process was to create a conceptual design of the database.
We knew from our interviews what sort of data the user expected to be in the database.
We also knew roughly how the user wanted the different types of data to relate to each others.
We used this information to create a conceptual design of the entities in the database and the relationships between them.

## Functional Requirements

For the functional requirements we determined what sort of functionality the user would expect from the database.

- Add library users
- Add library books with publishers and authors
- Join library books and users with rentals
- Add fees to overdue books
- Move due dates on books
- Correct spelling errors on records
- Change fee amounts
- Remove fees from rentals that have been returned

## Logical and Physical Design

The final stage for building the database was creating the logical and physical design.
We looked at the functional requirements and conceptual designs to build a database schema.
We decided on what tables were needed and what sort of data would be stored in them.