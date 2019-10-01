SELECT name from
    (SELECT member.name, COUNT(checkout_item.member_id) AS item_count
    FROM member
    LEFT JOIN checkout_item ON checkout_item.member_id = member.id
    GROUP BY member.name)
WHERE item_count > 1;
