create database taks5;
use taks5;

create table clients(
id int(11) primary key auto_increment,
client_name varchar(100)
);

create table projects(
id int(11) primary key auto_increment,
client_id int(11),
project_lead_id int(11)
);

create table employees(
id int(11) primary key auto_increment,
first_name varchar(30),
last_name varchar(30),
project_id int
);

alter table projects
add constraint fk_projects_clients
foreign key (client_id)
references clients(id),
add constraint fk_projects_employees
foreign key (project_lead_id)
references employees(id);

alter table employees
add constraint fk_employees_projects
foreign key (project_id)
references projects(id);