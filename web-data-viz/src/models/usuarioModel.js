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
        SELECT SUM(distinct CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
            SUM(distinct CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
            FROM frigorifico
            JOIN sensor ON fkFrigorifico = idFrigorifico
            JOIN historicofrigorifico AS anormal ON anormal.fkSensor = idSensor;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

// Gráfico de todos os frigorificos da Dashboard Loja
function todosFrigorificosLoja() {
  var mysqlQuery = `
        SELECT SUM(distinct CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
	        SUM(distinct CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
            FROM frigorifico JOIN sensor ON fkFrigorifico = idFrigorifico
            JOIN historicofrigorifico AS anormal ON anormal.fkSensor = idSensor
            JOIN loja on loja.idLoja = fkLoja;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

// Gráfico de todos os frigorificos da Dashboard Caminhao
function todosFrigorificosCaminhao() {
  var mysqlQuery = `
        SELECT SUM(distinct CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
	        SUM(distinct CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
            FROM frigorifico JOIN sensor ON fkFrigorifico = idFrigorifico
            JOIN historicofrigorifico AS anormal ON anormal.fkSensor = idSensor
            JOIN caminhao on caminhao.fkFrigorifico = idFrigorifico;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

function notificacaoAtencaoFrigorifico() {
  var mysqlQuery = `
        select count(anormal.temperatura) as anormal from frigorifico join sensor on fkFrigorifico = idFrigorifico 
        join historicofrigorifico as anormal on anormal.fkSensor = idSensor and (anormal.temperatura < 0 or anormal.temperatura > 4);
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
