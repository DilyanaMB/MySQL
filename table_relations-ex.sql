
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