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
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

// Gráfico de todos os frigorificos da Dashboard Loja
function todosFrigorificosLoja() {
  var mysqlQuery = `
       select sum(1+1+1) as anormal,
sum(1+1+1) as normal;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

// Gráfico de todos os frigorificos da Dashboard Caminhao
function todosFrigorificosCaminhao() {
  var mysqlQuery = `
        SELECT SUM(1) AS anormal,
	        SUM(4+1) AS normal;
    `;
  console.log("Executando a instrução SQL: \n" + mysqlQuery);
  return database.executar(mysqlQuery);
}

function notificacaoAtencaoFrigorifico() {
  var mysqlQuery = `
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
    COUNT(CASE WHEN status = 'anormal' THEN 1 END) AS anormal
FROM 
    SensorStatus;
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
