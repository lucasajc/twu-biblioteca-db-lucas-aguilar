SELECT member.name FROM member
INNER JOIN checkout_item ON member.id = checkout_item.member_id
INNER JOIN book ON book.title="The Pragmatic Programmer";
