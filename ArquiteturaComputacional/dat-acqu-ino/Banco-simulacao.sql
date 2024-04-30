-- CRIAÇÃO DO BANCO DE DADOS
create database frozenMeat;
use frozenMeat;

-- CRIAÇÃO DAS TABELAS DO DOMINIO DE USUARIO
create table tipoUsuario(
idtipoUsuario int primary key auto_increment,
cpf_cnpj varchar (14) not null
);
-- ok

create table usuario(
id int primary key auto_increment,
registro datetime,
nome varchar (256),
email varchar (256),
telefone varchar (13),
senha varchar(255),
cargo varchar(80),
fkTipoUsuario int,
foreign key (fkTipoUsuario) references tipoUsuario(idTipoUsuario)
);
-- ok

create table relacao(
idRelacao int auto_increment,
fkUsuario int,
fkFrigorifico int,
dataAcesso datetime default current_timestamp,
PRIMARY KEY (idRelacao, fkUsuario, fkFrigorifico),
constraint fkUsuarioFrigorifico foreign key (fkUsuario) REFERENCES usuario(id),
constraint fkFrigorificoUsuario foreign key (fkFrigorifico) REFERENCES frigorifico(id)
);
-- ok

-- CRIACÃO DAS TABELAS DO DOMINIO DO TRANSPORTE
create table transportadora (
idTransportadora int primary key not null,
nome varchar(45) not null,
cep varchar(45) not null,
frotas int not null);
-- ok

create table caminhao (
idTransporte int auto_increment,
placa varchar(45) not null,
modelo varchar(45) not null,
fkFrigorifico int,
fkTransportadora int,
primary key (idTransporte, fkTransportadora),
constraint frigorificoCaminhao foreign key (fkFrigorifico) references transportadora(idTransportadora),
constraint transportadoraCaminhao foreign key (fkTransportadora) references transportadora(idTransportadora));
-- ok

-- CRIAÇÃO DAS TABELAS DO DOMINIO DA LOJA
create table empresa(
idEmpresa int primary key auto_increment,
nome varchar (45),
cep char (80)
);
-- ok

create table loja(
idLoja int primary key auto_increment,
nome varchar (45),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);
-- ok

-- CRIAÇÃO DAS TABELAS DO DOMINIO DO FRIGORIFICO
create table frigorifico (
id int primary key auto_increment,
registrado_em datetime,
temperatura_ideal_minima double,
temperatura_ideal_maxima double,
fkTipo int,
fkLoja int,

constraint fkTipo foreign key (fkTipo) references tipoFrigorifico(idTipo),
constraint fkLoja foreign key (fkLoja) references loja(idLoja)
);
-- ok

create table tipoFrigorifico (
idTipo int primary key auto_increment,
tipo varchar(256),
registro date
);
-- ok

create table sensor (
idSensor int primary key auto_increment,
fkFrigorifico int,
registro date,
constraint fkFrigorificoSensor foreign key (fkFrigorifico) references frigorifico(id)

);
-- ok

create table historicoFrigorifico (
idHistorico int auto_increment,
registrado_em datetime,
temperatura double,
fkSensor int,
primary key (idHistorico, fkSensor),
constraint fkSensor foreign key (fkSensor) references sensor(idSensor)
);
-- ok
