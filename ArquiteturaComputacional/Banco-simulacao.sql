create database arqcomp;
use arqcomp;

create table medida (
id int primary key auto_increment,
lm35_temperatura float,
dt datetime default current_timestamp
);

select * from medida;
truncate table medida;