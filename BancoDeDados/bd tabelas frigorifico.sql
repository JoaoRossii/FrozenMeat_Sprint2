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
idSensor int auto_increment,
fkFrigorifico int,
registro date,
primary key (idSensor, fkFrigorifico),
constraint fkFrigorificoSensor foreign key (fkFrigorifico) references frigorifico(id)

);
create table historicoFrigorifico (
idHistorico int auto_increment,
registrado_em datetime,
temperatura double,
fkSensor int,
primary key (idHistorico, fkSensor)
constraint fkSensor foreign key (fkSensor) references sensor(idSensor)

);