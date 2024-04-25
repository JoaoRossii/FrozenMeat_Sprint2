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
