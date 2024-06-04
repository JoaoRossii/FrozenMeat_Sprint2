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

create table quiz(
	idQuiz int primary key auto_increment,
    certas int,
    erradas int,
    fkUsuario int,
    foreign key (fkUsuario) references usuario(ra)
);

alter table usuario add constraint checkUsuario check (vaporwave in ('Sim', 'Não'));

select * from usuario;

select * from quiz;

select sum(certas) as 'Acertos', sum(erradas) as 'Erros' from quiz;

truncate table usuario;