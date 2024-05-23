create database vaporwave;
use vaporwave;

create table usuario (
	ra int primary key,
    nome varchar(254),
    email varchar(254),
    senha varchar(45),
    curso varchar(45),
    vaporwave varchar(3)
);

alter table usuario add constraint checkUsuario check (vaporwave in ('Sim', 'Não'));

select * from usuario;

truncate table usuario;