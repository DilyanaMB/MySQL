create  database gamebar;

create table gamebar.employees(
id int not null auto_increment,
first_name varchar(50),
last_name varchar(50),
primary key(id)
);

create table gamebar.categories(
id int not null auto_increment,
name varchar(50) not null,
primary key(id)
);

create table gamebar.products(
id int not null auto_increment,
name varchar(50) not null,
category_id int,
primary key(id),
foreign key (category_id) references categories(id)
);

insert into gamebar.employees (first_name,last_name)
values ('victor', 'andreev'),
('daria', 'dimitrova'),
('emo','bodurov');

insert into gamebar.categories (name)
values('books'), ('PC-s'), ('games');

insert into gamebar.products (name,category_id)
values ('The book thief',1), ('MacBook Air M4',2), ('Monopoly',3);

update gamebar.products
set name='1984', category_id=1
where id=3;

delete from gamebar.products
where id=3;

drop table gamebar.products;

drop database gamebar;