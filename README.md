# TWU - The Biblioteca Database

## Question 1
> Who checked out the book 'The Hobbit’?

Query:

```sql
SELECT member.name FROM member
INNER JOIN checkout_item ON member.id = checkout_item.member_id
INNER JOIN book ON book.id = checkout_item.book_id
WHERE book.title="The Hobbit";
```

Result:

```
Anand Beck
```


## Question 2
> How many people have not checked out anything?

Query:

```sql
SELECT COUNT(member.id) FROM member
LEFT JOIN checkout_item ON checkout_item.member_id = member.id
WHERE checkout_item.book_id IS NULL AND checkout_item.movie_id IS NULL;
```

Result:

```
37
```

## Question 3
> What books and movies aren't checked out?

Queries:

```sql
SELECT book.title FROM book
WHERE book.id NOT IN
    (SELECT book.id
    FROM checkout_item
    INNER JOIN book ON book.id = checkout_item.book_id);
```

```sql
SELECT movie.title FROM movie
WHERE movie.id NOT IN
    (SELECT movie.id
    FROM checkout_item
    INNER JOIN movie ON movie.id = checkout_item.movie_id);
```

Results:

```
Fellowship of the Ring
1984
Tom Sawyer
Catcher in the Rye
To Kill a Mockingbird
Domain Driven Design
```

```
Thin Red Line
Crouching Tiger, Hidden Dragon
Lawrence of Arabia
Office Space
```

## Question 4
> Add the book 'The Pragmatic Programmer', and add yourself as a member. Check out 'The Pragmatic Programmer'. Use your query from question 1 to verify that you have checked it out. Also, provide the SQL used to update the database.

Queries:

```sql
INSERT INTO book (title)
VALUES ("The Pragmatic Programmer");
```

```sql
INSERT INTO member (name)
VALUES ("Lucas de Aguilar");
```

```sql
INSERT INTO checkout_item (member_id, book_id)
VALUES (43, 11);
```

```sql
SELECT member.name FROM member
INNER JOIN checkout_item ON member.id = checkout_item.member_id
INNER JOIN book ON book.id = checkout_item.book_id
WHERE book.title="The Pragmatic Programmer";
```

Result

```
Lucas de Aguilar
```

## Question 5
> Who has checked out more than 1 item? 

Query:

```sql
SELECT name from
    (SELECT member.name, COUNT(checkout_item.member_id) AS item_count
    FROM member
    LEFT JOIN checkout_item ON checkout_item.member_id = member.id
    GROUP BY member.name)
WHERE item_count > 1;
```

Result

```
Anand Beck
Frank Smith
```
