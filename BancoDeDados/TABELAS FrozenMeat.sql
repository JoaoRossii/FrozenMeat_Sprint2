-- CRIAÇÃO DO BANCO DE DADOS
create database frozenMeat;
use frozenMeat;
show tables;

-- CRIAÇÃO DA TABELA EMPRESA
create table empresa (
  idEmpresa int primary key auto_increment,
  nome varchar(256),
  cep char(8)
);

-- CRIAÇÃO DA TABELA LOJA
create table loja (
  idLoja int primary key auto_increment,
  nome varchar (256),
  fkEmpresa int,

  foreign key (fkEmpresa) references empresa(idEmpresa)
);

-- CRIAÇÃO DA TABELA DOS TIPOS DE USUARIO
create table tipoUsuario (
  idTipoUsuario int primary key auto_increment,
  tipo varchar (256)
  -- criar uma constraint para pessoa fisica e juridica
);

-- CRIAÇÃO DA TABELA USUARIO
create table usuario (
  idUsuario int primary key auto_increment,
  registro datetime default current_timestamp,
  nome varchar (256),
  email varchar (256),
  telefone char (11),
  cpf_cnpj varchar (50),
  senha varchar(256),
  cargo varchar(256),
  fkTipoUsuario int,
  fkLoja int,
-- constraint para cargo?? funcionario

  foreign key (fkTipoUsuario) references tipoUsuario(idTipoUsuario),
  foreign key (fkLoja) references loja(idLoja)
);


-- CRIAÇÃO DA TABELA DOS TIPOS DE FRIGORIFICO
create table tipoFrigorifico (
  idTipoFrigorifico int primary key auto_increment,
  tipo varchar(256)
  -- constraint para o tipo fixo ou movel
);

-- CRIAÇÃO DA TABELA FRIGORIFICO
create table frigorifico (
  idFrigorifico int primary key auto_increment,
  nome varchar(256),
  registrado_em datetime default current_timestamp,
  temperatura_ideal_minima double,
  temperatura_ideal_maxima double,
  fkTipo int,
  fkLoja int,

  constraint fkTipo foreign key (fkTipo) references tipoFrigorifico(idTipoFrigorifico),
  constraint fkLoja foreign key (fkLoja) references loja(idLoja)
);

-- CRIAÇÃO DA TABELA RELAÇÃO
create table relacao (
  idRelacao int auto_increment,
  fkUsuario int,
  fkFrigorifico int,
  dataAcesso datetime default current_timestamp,

  primary key (idRelacao, fkUsuario, fkFrigorifico),
  constraint fkUsuarioFrigorifico foreign key (fkUsuario) REFERENCES usuario(idUsuario),
  constraint fkFrigorificoUsuario foreign key (fkFrigorifico) REFERENCES frigorifico(idFrigorifico)
);

-- CRIAÇÃO DA TABELA DA TRANSPORTADORA
create table transportadora (
  idTransportadora int primary key auto_increment,
  nome varchar(256) not null,
  cep char(8) not null,
  frotas int not null
);

-- CRIAÇÃO DA TABELA DO CAMINHÃO
create table caminhao (
  idCaminhao int auto_increment,
  placa char(7) not null,
  modelo varchar(256) not null,
  fkFrigorifico int,
  fkTransportadora int,

  primary key (idCaminhao, fkTransportadora),
  constraint frigorificoCaminhao foreign key (fkFrigorifico) references frigorifico(idFrigorifico),
  constraint transportadoraCaminhao foreign key (fkTransportadora) references transportadora(idTransportadora)
);

-- CRIAÇÃO DA TABELA DOS SENSORES
create table sensor (
  idSensor int primary key auto_increment,
  fkFrigorifico int,
  registrado_em datetime default current_timestamp,

  constraint fkFrigorificoSensor foreign key (fkFrigorifico) references frigorifico(idFrigorifico)
);

-- CRIAÇÃO DA TABELA DO HISTORICO DE TEMPERATURA DOS FRIGORIFICOS
create table historicofrigorifico (
  idHistoricoFrigorifico int auto_increment,
  registrado_em datetime default current_timestamp,
  temperatura double,
  fkSensor int,

  primary key (idHistoricoFrigorifico, fkSensor),
  constraint fkSensor foreign key (fkSensor) references sensor(idSensor)
);

select * from historicofrigorifico;

-- CRIÇÃO DOS INSERT DE CADA TABELA

-- ADIÇÃO DOS TIPOS DE USUARIO
INSERT INTO tipoUsuario (tipo) VALUES
("Pessoa Física"),
("Pessoa Jurídica");

-- ADIÇÃO DOS DADOS USUARIOS
INSERT INTO usuario (registro, nome, email, telefone, cpf_cnpj, senha, cargo, fkTipoUsuario) VALUES
   ("2022-07-06 09:29:26","Boris Bradley","borisbradley@hotmail.com","11948489368", "50124842855","Ptbuk3637","usuario",1),             -- usuario 
   ("2023-09-12 10:23:25","Wesley Mclean","wesleymclean@outlook.com","11929345786", "50326957842","Kxvca7527","funcionário",1),         -- funcionário 
   ("2018-06-27 17:04:11","Lila Rowland","lilarowland3038@hotmail.com","11925878821", "50666443857","Lgcrr2226","funcionário",1),       -- funcionário 
   ("2018-10-24 15:26:57","Elvis Berger","elvisberger222@outlook.com","11944647365", "50377147892","Bhhld4520","gerente",1),            -- funcionário 
   ("2023-06-06 20:36:14","Summer Lewis","summerlewis@hotmail.com","11988441252", "15841944000143","Bsymz6133","dono",2),               -- dono 
   ("2021-11-19 18:50:22","Joan Gray","joangray@hotmail.com","11906954701", "81561418000284","Swjqq0648","dono",2),                     -- dono 
   ("2021-09-26 13:16:58","Genevieve Sargent","genevievesargent@google.com","11918372815", "50538475897","Yceiw4299","gerente",1),      -- gerente 
   ("2020-08-14 17:55:09","Ezekiel Murray","ezekielmurray@outlook.com","11982356205", "50674447847","Hwjyr3182","funcionário",1),      -- funcionário
   ("2019-12-16 22:42:41","Ishmael Booker","ishmaelbooker6726@google.com","11961751818", "50701523881","Smkku6636","funcionário",1);   -- funcionário 
select * from usuario;

-- ADIÇÃO DOS DADOS DAS EMPRESAS
 INSERT INTO empresa (nome, cep) VALUES
 ( "Swift","61742737");
select * from empresa;
select * from loja;
select * from tipoFrigorifico;

-- ADIÇÃO DOS DADOS DAS LOJAS
 INSERT INTO loja (nome, fkEmpresa) VALUES
 ( "Swift - Pamplona",1),
 ( "Swift - Vila Mariana",1),
 ( "Swift - Cambuci",1),
 ( "Swift - Pirituba",1);

-- ADIÇÃO DOS DADOS DO TIPO DE FRIGORIFICO
 INSERT INTO tipoFrigorifico(tipo) VALUES
 ("Fixo"),
 ("Movél");

-- ADIÇÃO DOS DADOS DOS FRIGORIFICOS
 INSERT INTO frigorifico(nome, temperatura_ideal_minima, temperatura_ideal_maxima, fkTipo, fkLoja) VALUES
 ('a',0,4,1,3),
 ('b',0,4,1,3),
 ('c',0,4,1,3),
 ('d',-4,2,2,2);
select * from sensor;
-- ADIÇÃO DOS DADOS DOS SENSORES DOS FRIGORIFICOS
 INSERT INTO sensor (fkFrigorifico) VALUES
 (1),
 (2),
 (3),
 (4);


-- ADIÇÃO DOS DADOS DO HISTORICO DE REGISTROS DOS SENSORES DOS FRIGORIFICOS
-- TEM QUE SER ATRAVES DO ARDUINO
INSERT INTO historicofrigorifico(registrado_em, temperatura, fkSensor) VALUES
("2024-02-03 11:23:22",10,1),
("2024-02-03 11:23:22",-4,2),
("2024-02-03 11:23:22",-2,3),
("2024-02-03 11:23:22",-2,4);

 INSERT INTO relacao (fkUsuario, fkFrigorifico, dataAcesso) VALUES
 ( 1 ,1,default),
 ( 2,2,default),
 ( 7,3,default);
 
 select * from frigorifico;

select * from sensor join historicofrigorifico on fksensor = idsensor;

-- ADIÇÃO DOS DADOS DA TRANSPORTADORA
 INSERT INTO transportadora (nome, cep, frotas) VALUES
 ('Vale do Mogi','59460368','45'),
 ('KP Transportes','74102313','30');

 -- ADIÇÃO DOS DADOS DO CAMINHÃO
INSERT INTO caminhao (placa, modelo, fkFrigorifico, fkTransportadora) VALUES
 ("WLS7H61","Actros Refrigerado",1,1),
 ("KLX9D72","Actros Refrigerado",2,1),
 ("GIU2F75","Scania R-series Refrigerado",3,2),
 ("RXP9G14","Scania R-series Refrigerado",4,2);

-- CRIAÇÃO DOS JOIN DAS TABELAS

-- CONSULTA N PARA N 
SELECT usuario.nome as NomeUsuario, frigorifico.idFrigorifico, relacao.dataAcesso AS DataDeAcesso
FROM usuario
JOIN relacao ON usuario.idUsuario = relacao.fkUsuario
JOIN frigorifico ON relacao.fkFrigorifico = frigorifico.idFrigorifico;

-- JOIN CAMINHÃO E TRANSPORTADORA
SELECT caminhao.placa, caminhao.modelo, transportadora.nome AS Transportadora
FROM caminhao
JOIN transportadora ON caminhao.fkTransportadora = transportadora.idTransportadora;

-- JOIN LOJA E EMPRESA
SELECT loja.nome AS loja, empresa.nome AS Empresa
FROM loja
JOIN empresa ON loja.fkEmpresa = empresa.idEmpresa;

-- JOIN SENSOR E FRIGORIFICO
SELECT sensor.idSensor as Sensor, frigorifico.idFrigorifico as Frigorifico, 
frigorifico.temperatura_ideal_minima as TempMinima, frigorifico.temperatura_ideal_maxima as TempMaxima
FROM sensor
JOIN frigorifico ON sensor.fkFrigorifico = frigorifico.idFrigorifico;
-- adicionar a loja

-- JOIN HISTORICOFRIGORIFICO E SENSOR
-- SELECT historicoFrigorifico.idHistoricoFrigorifico as RegistroHistorico, historicoFrigorifico.registrado_em, sensor.idSensor as Sensor
-- FROM historicoFrigorifico
-- JOIN sensor ON historicoFrigorifico.fkSensor = sensor.idSensor;


-- CREATE VIEW SIMULANDO VÁRIOS SENSORES COM APENAS 1 SENSOR FÍSICO
alter table sensor add column fator float;
update sensor set fator = -0.5 where idSensor = 1;
update sensor set fator = 2.5 where idSensor = 2;
update sensor set fator = -0.2 where idSensor = 3;
update sensor set fator = 2.8 where idSensor = 4;
update sensor set fator = 2.8 where idSensor = 5;
update sensor set fator = 1 where idSensor = 6;
update sensor set fator = 0.6 where idSensor = 7;

-- select sensor.idSensor as sensor, (historicoFrigorifico.temperatura * sensor.fator) as temperatura from sensor, historicoFrigorifico;
create view Sensores as (select sensor.idSensor as sensor, (historicofrigorifico.temperatura * sensor.fator) as temperatura, historicofrigorifico.registrado_em as horario from sensor, historicofrigorifico);
select * from Sensores;
select truncate(temperatura, 2) as temperatura, sensor, horario from Sensores where sensor = 1 limit 24;
select truncate(temperatura, 2) as temperatura, sensor, horario from Sensores where sensor = 3 limit 24;
select truncate(temperatura, 2) as temperatura, sensor, horario from Sensores where sensor = 4 limit 24;
select truncate(temperatura, 2) as temperatura, sensor, horario from Sensores where sensor = 5 limit 24;

select * from usuario;
select * from loja;
select * from historicoFrigorifico;

select * from frigorifico;	

select * from frigorifico join Sensor on fkFrigorifico = idFrigorifico join historicoFrigorifico on fkSensor = idSensor ;

select count(anormal.temperatura) as anormal from frigorifico join sensor on fkFrigorifico = idFrigorifico 
join historicofrigorifico as anormal on anormal.fkSensor = idSensor and (anormal.temperatura < 0 or anormal.temperatura > 4);

select count(normal.temperatura) as normal from frigorifico join sensor on fkFrigorifico = idFrigorifico 
join historicofrigorifico as normal on normal.fkSensor = idSensor and normal.temperatura between 0 and 4;

-- select todos frigorificos com temperatura normal e anormal
SELECT SUM(CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
	   SUM(CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
FROM frigorifico JOIN sensor ON fkFrigorifico = idFrigorifico
JOIN historicofrigorifico AS anormal ON anormal.fkSensor = idSensor;

-- select todos frigorificos com temperatura normal e anormal filtrado por sensor
SELECT SUM(CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
	   SUM(CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
FROM frigorifico JOIN sensor ON fkFrigorifico = idFrigorifico
JOIN historicofrigorifico AS anormal ON anormal.fkSensor = idSensor where fksensor in (14, 15);

-- select frigorificos caminhao com temperatura normal e anormal filtrado por sensor
SELECT 
	SUM(CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
	SUM(CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
FROM frigorifico JOIN sensor ON fkFrigorifico = idFrigorifico
JOIN historicofrigorifico AS anormal ON anormal.fkSensor = idSensor
JOIN caminhao on caminhao.fkFrigorifico = idFrigorifico;

-- select frigorificos loja com temperatura normal e anormal filtrado por sensor
SELECT 
	 SUM(CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
	 SUM(CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
FROM frigorifico JOIN sensor ON fkFrigorifico = idFrigorifico
JOIN historicofrigorifico AS anormal ON anormal.fkSensor = idSensor
JOIN loja on loja.idLoja = fkLoja;

select 
count(case when temperatura < 0 or temperatura > 4 then 1 end) as anormal,
count(case when temperatura between 0 and 4 then 1 end) as normal
from historicofrigorifico join sensor on idSensor = fkSensor;


WITH SensorStatus AS (
    SELECT 
        fkSensor,
        CASE 
            WHEN MAX(temperatura) > 4 OR MIN(temperatura) < 0 THEN 'anormal'
            ELSE 'normal'
        END AS status
    FROM 
        historicofrigorifico
    GROUP BY 
        fkSensor
)
SELECT 
    COUNT(CASE WHEN status = 'anormal' THEN 1 END) AS anormal,
    COUNT(CASE WHEN status = 'normal' THEN 1 END) AS normal
FROM 
    SensorStatus;

insert into historicofrigorifico (fkSensor, temperatura) values 
(1, -2),
(2, -2),
(3, -2),
(4, -2),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3);

select * from historicofrigorifico;


select * from frigorifico join sensor on fkFrigorifico = idFrigorifico 
join historicofrigorifico on fkSensor = idSensor;

select * from frigorifico join sensor on fkFrigorifico = idFrigorifico 
join historicofrigorifico on fkSensor = idSensor
join caminhao on caminhao.fkFrigorifico = frigorifico.idFrigorifico;

select * from frigorifico join sensor on fkFrigorifico = idFrigorifico 
join historicofrigorifico on fkSensor = idSensor
join loja on idloja = fkLoja
join caminhao on fkLoja = loja.idloja;

select * from loja;
select * from sensor;
select * from frigorifico;
select * from historicofrigorifico;
select * from caminhao;

update frigorifico set fkLoja = null where idFrigorifico in (8, 9, 13, 14);

select f.nome nomeFrigorifico,
  tf.tipo tipoFrigorifico,
  f.registrado_em dataRegistro
  from frigorifico f
  join tipoFrigorifico tf on f.fkTipo = tf.idTipoFrigorifico
  join sensor s on f.idFrigorifico = s.fkFrigorifico
  join historicofrigorifico hf on s.idSensor = hf.fkSensor
  and (hf.temperatura < f.temperatura_ideal_minima or hf.temperatura > f.temperatura_ideal_maxima)
  join relacao r on f.idFrigorifico = r.fkFrigorifico
  right join usuario u on r.fkUsuario = u.idUsuario
  where u.idUsuario = 2;
  
  select * from usuario;
  
  alter table usuario modify column cpf_cnpj varchar(33);
  
select * from frigorifico join sensor on fkFrigorifico = idFrigorifico 
join historicofrigorifico on fkSensor = idSensor;

select * from frigorifico join sensor on fkFrigorifico = idFrigorifico 
join historicofrigorifico on fkSensor = idSensor
join caminhao on caminhao.fkFrigorifico = frigorifico.idFrigorifico;

select loja.nome, tipoFrigorifico.tipo from frigorifico  join sensor on fkFrigorifico = idFrigorifico 
left join historicofrigorifico on fkSensor = idSensor
join loja on idloja = fkLoja
join tipoFrigorifico on idTipoFrigorifico = fkTipo;

select loja.nome, tipo from loja join frigorifico on fkLoja = idLoja 
join tipoFrigorifico on idTipoFrigorifico = fkTipo;


select * from loja;
select * from sensor;
select * from frigorifico;

truncate frigorifico;
select * from historicofrigorifico;
select * from caminhao;
select * from tipoFrigorifico;
  
  