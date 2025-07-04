use camp;

-- 1. Mountains and Peaks

create table mountains(
id int primary key auto_increment,
name varchar(100)
);

create table peaks (
id int primary key auto_increment,
name varchar(100),
mountain_id int,
constraint fk_Peak_Mountains 
foreign key (mountain_id)
references mountains(id)
);

-- 2. Trip Organization

select c.id, vehicle_type, 
concat(c.first_name,' ', c.last_name) as driver_name
from campers c
join vehicles v
on c.id = v.driver_id;

-- 3. SoftUni Hiking

select r.starting_point as route_starting_point,
r.end_point as route_ending_point, 
leader_id, 
concat(first_name, ' ', last_name) as leader_name
from routes r
join campers c
on r.leader_id=c.id;

-- 4. Delete Mountains

drop table mountains;

drop table peaks;

create table peaks (
id int primary key auto_increment,
name varchar(100),
mountain_id int,
constraint fk_Peak_Mountains foreign key (mountain_id)
references mountains(id)
on delete cascade
);

-- 5. Project Management DB

create database task5;

use task5;

create table clients(
id int primary key auto_increment,
client_name varchar(100) not null
);

create table projects(
id int primary key auto_increment,
client_id int,
project_lead_id int
);

create table employees(
id int primary key auto_increment,
first_name varchar(30),
last_name varchar(30),
project_id int 
);

alter table projects
add constraint fk_projects_employees
foreign key (project_lead_id)
references employees(id),
add constraint fk_Projects_clients 
foreign key (client_id)
references clients(id);

alter table employees
add constraint fk_employees_projects
foreign key (project_id)
references project(id);