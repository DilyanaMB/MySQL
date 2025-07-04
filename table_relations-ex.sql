
-- 1. One-To-One Relationship

create database people_passports;

use people_passports;

create table people (
person_id int primary key auto_increment,
first_name varchar(30),
salary varchar(30),
passport_id int unique
);

create table passport (
passport_id int primary key auto_increment,
passport_number varchar(30) unique
);

alter table people
add constraint fk_people_passport
foreign key (passport_id)
references passport(passport_id);

-- 2. One-To-Many Relationship

create table manufacturers(
manufacturer_id int primary key auto_increment,
name varchar(30),
established_on date
);

create table models(
model_id int primary key auto_increment,
name varchar(30),
manufacturer_id int unique,
constraint fk_models_manufacturers
foreign key (manufacturer_id)
references manufacturers(manufacturer_id)
);

-- 3. Many-To-Many Relationship

create table students(
student_id int primary key auto_increment,
name varchar(30)
);

create table exams(
exam_id int primary key auto_increment,
name varchar(30)
);

create table students_exams(
student_id int,
exam_id int,
primary key (student_id, exam_id),
constraint fk_se_s
foreign key (student_id)
references students(student_id),
constraint fk_se_e
foreign key (exam_id)
references exams(exam_id)
);

-- 4. Self-Referencing

create table teachers(
teacher_id int primary key auto_increment,
name varchar(30),
manager_id int unique,
constraint fk_teachers_teachers
foreign key (manager_id)
references teachers(teacher_id)
);

-- 5. Online Store Database

create database online_store; 

use online_store;

create table items(
item_id int primary key auto_increment,
name varchar(50),
item_type_id int unique
);

create table order_items(
order_id int unique,
item_id int unique
);

create table orders(
order_id int primary key auto_increment,
customer_id int unique
);

create table item_types(
item_type_id int primary key auto_increment,
name varchar(50)
);

create table cities(
city_id int primary key auto_increment,
name varchar(50)
);

create table customers(
customer_id int primary key auto_increment,
name varchar(50),
birthday date,
city_id int unique
);

alter table items
add constraint fk_items_it
foreign key (item_type_id)
references item_types(item_type_id);

alter table order_items
add constraint fk_or_i
foreign key (item_id)
references items(item_id),
add constraint fk_oi_o
foreign key(order_id)
references orders(order_id);

alter table orders
add constraint fk_o_customers
foreign key (customer_id)
references customers(customer_id);

alter table customers
add constraint fk_customers_cities
foreign key (city_id)
references cities(city_id);

-- 6. University Database

create database university;

use university;

create table subjects(
subject_id int primary key auto_increment,
subject_name varchar(50)
);

create table agenda(
student_id int,
subject_id int,
primary key(student_id, subject_id)
);

create table students(
student_id int primary key auto_increment,
student_number varchar(12) unique,
student_name varchar(50),
major_id int unique
);

create table majors(
major_id int primary key auto_increment,
name varchar(50)
);

create table payments(
payment_id int primary key auto_increment,
payment_date date,
payment_amount decimal(8,2),
student_id int
);

alter table agenda
add constraint fk_agenda_subjects
foreign key (subject_id)
references subjects(subject_id),
add constraint fk_agenda_students
foreign key (student_id)
references students(student_id);

alter table students
add constraint fk_student_majors
foreign key (major_id)
references majors(major_id);

alter table payments
add constraint fk_payments_students
foreign key (student_id)
references students(student_id);

-- 9. Peaks in Rila
use geography;

select mountain_range, peak_name, p.elevation as peak_elevation 
from mountains m
join peaks p
on m.id = p.mountain_id
order by p.elevation desc;
