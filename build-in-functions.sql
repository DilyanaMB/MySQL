use book_library;

select title from books
where  substring(title,1,3) = 'The'
order by id;

select replace(title, "The", "***") as title
from books
where substring(title, 1, 3) = "The"
order by id;

select round(sum(cost),2) from books;

select concat_ws(" ", first_name,last_name) as full_name,
timestampdiff(day, born, died) as days_lived
from authors;

select title from books
where title like '%Harry Potter%'
order by id;