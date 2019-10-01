SELECT member.name FROM member
INNER JOIN checkout_item ON member.id = checkout_item.member_id
INNER JOIN book ON book.id = checkout_item.book_id
WHERE book.title="The Hobbit";
