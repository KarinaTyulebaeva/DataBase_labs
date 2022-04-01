--1
SELECT *
FROM book
JOIN author ON book.editor = author.author_id
--2
SELECT DISTINCT first_name, last_name
FROM    (SELECT *
        FROM    (SELECT author_id
                FROM author EXCEPT (SELECT editor
                                     FROM book)) tmp) tmp2, author
--3
SELECT author_id
FROM author EXCEPT (SELECT editor
                    FROM book)