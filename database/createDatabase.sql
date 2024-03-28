create database FrozenMeat;

use FrozenMeat;

create table usuario_fisico(
  id int primary key auto_increment,
  registrado_em datetime not null default current_timestamp,
  nome varchar(80) not null,
  email varchar(80) not null unique,
  cpf char(11) not null unique,
  telefone varchar(13) not null unique,
  senha varchar(255) not null,
  cargo varchar(80) not null,
  constraint chkCargo check (cargo in ('gerente', 'funcionário'))
);

create table usuario_juridico(
  id int primary key auto_increment,
  registrado_em datetime not null default current_timestamp,
  nome varchar(80) not null,
  email varchar(80) not null unique,
  cnpj char(14) not null unique,
  telefone varchar(13) not null unique,
  senha varchar(255) not null,
  cargo varchar(80) not null
);

create table frigorifico(
  id int primary key auto_increment,
  registrado_em datetime not null default current_timestamp,
  endereco varchar(80) not null unique,
  cep char(9) not null unique,
  temperatura_ideal_minima double not null default 0,
  temperatura_ideal_maxima double not null default 4
);

create table usuario_fisico_frigorifico(
  id_usuario int not null,
  id_frigorifico int not null
);

create table usuario_juridico_frigorifico(
  id_usuario int not null,
  id_frigorifico int not null
);

create table historico_frigorifico(
  registrado_em datetime not null default current_timestamp,
  id_frigorifico int not null,
  temperatura double not null
);
