create database frozenMeat;

use frozenMeat;

create table tipoUsuario(
idtipoUsuario int primary key auto_increment,
cpf_cnpj varchar (14) not null
);

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

create table relacao(
idRelacao int auto_increment,
fkUsuario int,
fkFrigorifico int,
dataAcesso datetime default current_timestamp,
PRIMARY KEY (idRelacao, fkUsuario, fkFrigorifico),
constraint fkUsuarioFrigorifico foreign key (fkUsuario) REFERENCES usuario(id),
constraint fkFrigorificoUsuario foreign key (fkFrigorifico) REFERENCES frigorifico(id)
);

create table transportadora (
idTransportadora int primary key not null,
nome varchar(45) not null,
cep varchar(45) not null,
frotas int not null);

create table caminhao (
idTransporte int auto_increment,
placa varchar(45) not null,
modelo varchar(45) not null,
fkFrigorifico int,
fkTransportadora int,
primary key (idTransporte, fkTransportadora),
constraint frigorificoCaminhao foreign key (fkFrigorifico) references transportadora(idTransportadora),
constraint transportadoraCaminhao foreign key (fkTransportadora) references transportadora(idTransportadora));

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar (45),
cep char (80)
);

create table loja(
idLoja int primary key auto_increment,
nome varchar (45),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

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

create table tipoFrigorifico (
idTipo int primary key auto_increment,
tipo varchar(256),
registro date
);

create table sensor (
idSensor int primary key auto_increment,
fkFrigorifico int,
registro date,
constraint fkFrigorificoSensor foreign key (fkFrigorifico) references frigorifico(id)

);

create table historicoFrigorifico (
idHistorico int auto_increment,
registrado_em datetime,
temperatura double,
fkSensor int,
primary key (idHistorico, fkSensor),
constraint fkSensor foreign key (fkSensor) references sensor(idSensor)
);