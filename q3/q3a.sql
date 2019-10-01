SELECT book.title FROM book
WHERE book.id NOT IN
    (SELECT book.id
    FROM checkout_item
    INNER JOIN book ON book.id = checkout_item.book_id);
