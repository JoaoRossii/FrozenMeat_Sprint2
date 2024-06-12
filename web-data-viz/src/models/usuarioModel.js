var database = require("../database/config");

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, cpfCnpj, cargo, email, telefone, senha) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():",
    nome,
    email,
    senha
  );

  // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
  //  e na ordem de inserção dos dados.
  var instrucaoSql = `
        INSERT INTO usuario (nome, email, telefone, cpf_cnpj, senha, cargo, fkTipoUsuario) VALUES ('${nome}', '${email}', '${telefone}', '${cpfCnpj}', '${senha}', '${cargo}', 1);
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function autenticar(cpfCnpj, senha) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ",
    cpfCnpj,
    senha
  );
  var instrucaoSql = `
        SELECT idUsuario, nome, email FROM usuario WHERE cpf_cnpj = '${cpfCnpj}' AND senha = '${senha}';
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

// Gráfico de todos os frigorificos da Dashboard
function todosFrigorificos() {
  var mysqlQuery = `
       WITH UltimoRegistro AS (
    SELECT 
        anormal.*,
        ROW_NUMBER() OVER (PARTITION BY sensor.fkFrigorifico ORDER BY anormal.registrado_em DESC) AS rn
    FROM 
        historicofrigorifico AS anormal
    JOIN 
        sensor ON anormal.fkSensor = sensor.idSensor
)

SELECT 
    SUM(CASE WHEN UltimoRegistro.temperatura < 0 OR UltimoRegistro.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
    SUM(CASE WHEN UltimoRegistro.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
FROM 
    frigorifico
JOIN 
    sensor ON sensor.fkFrigorifico = frigorifico.idFrigorifico
JOIN 
    UltimoRegistro ON UltimoRegistro.fkSensor = sensor.idSensor AND UltimoRegistro.rn = 1;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

// Gráfico de todos os frigorificos da Dashboard Loja
function todosFrigorificosLoja() {
  var mysqlQuery = `
       WITH UltimoRegistro AS (
    SELECT 
        anormal.*,
        ROW_NUMBER() OVER (PARTITION BY sensor.fkFrigorifico ORDER BY anormal.registrado_em DESC) AS rn
    FROM 
        historicofrigorifico AS anormal
    JOIN 
        sensor ON anormal.fkSensor = sensor.idSensor
)

SELECT 
    SUM(CASE WHEN UltimoRegistro.temperatura < 0 OR UltimoRegistro.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
    SUM(CASE WHEN UltimoRegistro.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
FROM 
    frigorifico
JOIN 
    sensor ON sensor.fkFrigorifico = frigorifico.idFrigorifico
JOIN 
    UltimoRegistro ON UltimoRegistro.fkSensor = sensor.idSensor AND UltimoRegistro.rn = 1;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

// Gráfico de todos os frigorificos da Dashboard Caminhao
function todosFrigorificosCaminhao() {
  var mysqlQuery = `
       WITH UltimoRegistro AS (
    SELECT 
        anormal.*,
        ROW_NUMBER() OVER (PARTITION BY sensor.fkFrigorifico ORDER BY anormal.registrado_em DESC) AS rn
    FROM 
        historicofrigorifico AS anormal
    JOIN 
        sensor ON anormal.fkSensor = sensor.idSensor
)

SELECT 
    SUM(CASE WHEN UltimoRegistro.temperatura < 0 OR UltimoRegistro.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
    SUM(CASE WHEN UltimoRegistro.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
FROM 
    frigorifico
JOIN 
    sensor ON sensor.fkFrigorifico = frigorifico.idFrigorifico
JOIN 
    UltimoRegistro ON UltimoRegistro.fkSensor = sensor.idSensor AND UltimoRegistro.rn = 1;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

function notificacaoAtencaoFrigorifico() {
  var mysqlQuery = `
        WITH UltimoRegistro AS (
    SELECT 
        anormal.*,
        ROW_NUMBER() OVER (PARTITION BY sensor.fkFrigorifico ORDER BY anormal.registrado_em DESC) AS rn
    FROM 
        historicofrigorifico AS anormal
    JOIN 
        sensor ON anormal.fkSensor = sensor.idSensor
)

SELECT 
    SUM(CASE WHEN UltimoRegistro.temperatura < 0 OR UltimoRegistro.temperatura > 2 THEN 1 ELSE 0 END) AS anormal
FROM 
    frigorifico
JOIN 
    sensor ON sensor.fkFrigorifico = frigorifico.idFrigorifico
JOIN 
    UltimoRegistro ON UltimoRegistro.fkSensor = sensor.idSensor AND UltimoRegistro.rn = 1;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

function tabelaDashDois_1() {
  var mysqlQuery = `
        select loja.nome, tipo from loja join frigorifico on fkLoja = idLoja 
join tipoFrigorifico on idTipoFrigorifico = fkTipo;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

function foraFaixa(idUsuario) {
  var mysqlQuery = `
  select f.idFrigorifico,
  f.nome nomeFrigorifico,
  tf.tipo tipoFrigorifico,
  f.registrado_em dataRegistro
  from frigorifico f
  join tipoFrigorifico tf on f.fkTipo = tf.idTipoFrigorifico
  join sensor s on f.idFrigorifico = s.fkFrigorifico
  join historicoFrigorifico hf on s.idSensor = hf.fkSensor
  and (hf.temperatura < f.temperatura_ideal_minima or hf.temperatura > f.temperatura_ideal_maxima)
  join relacao r on f.idFrigorifico = r.fkFrigorifico
  right join usuario u on r.fkUsuario = u.idUsuario
  where u.idUsuario = ${idUsuario};
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

function graficoLoja1() {
  var instrucaoSql = `select truncate(temperatura, 2) as temperatura, sensor, horario from Sensores where sensor = 1 limit 24;`;

  return database.executar(instrucaoSql);
}

function graficoLoja2() {
  var instrucaoSql = `select truncate(temperatura, 2) as temperatura, sensor, horario from Sensores where sensor = 2 limit 24;`;

  return database.executar(instrucaoSql);
}

function graficoLoja3() {
  var instrucaoSql = `select truncate(temperatura, 2) as temperatura, sensor, horario from Sensores where sensor = 3 limit 24;`;

  return database.executar(instrucaoSql);
}

function graficoLoja4() {
  var instrucaoSql = `select truncate(temperatura, 2) as temperatura, sensor, horario from Sensores where sensor = 4 limit 24;`;

  return database.executar(instrucaoSql);
}

module.exports = {
  autenticar,
  cadastrar,
  todosFrigorificos,
  todosFrigorificosLoja,
  todosFrigorificosCaminhao,
  notificacaoAtencaoFrigorifico,
  foraFaixa,
  graficoLoja1,
  graficoLoja2,
  graficoLoja3,
  graficoLoja4,
  tabelaDashDois_1
};
