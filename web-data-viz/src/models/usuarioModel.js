var database = require("../database/config")

function autenticar(cpfCnpj, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", cpfCnpj, senha)
    var instrucaoSql = `
        SELECT idUsuario, nome, email FROM usuario WHERE cpf_cnpj = '${cpfCnpj}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
    
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, cpfCnpj, cargo, email, telefone, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO usuario (nome, email, telefone, cpf_cnpj, senha, cargo, fkTipoUsuario) VALUES ('${nome}', '${email}', '${telefone}', '${cpfCnpj}', '${senha}', '${cargo}', 1);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Gráfico de todos os frigorificos da Dashboard
function todosFrigorificos() {
    var mysqlQuery = `
        SELECT SUM(CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
            SUM(CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
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
        SELECT SUM(CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
	        SUM(CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
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
        SELECT SUM(CASE WHEN anormal.temperatura < 0 OR anormal.temperatura > 4 THEN 1 ELSE 0 END) AS anormal,
	        SUM(CASE WHEN anormal.temperatura BETWEEN 0 AND 4 THEN 1 ELSE 0 END) AS normal
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

module.exports = {
    autenticar,
    cadastrar,
    todosFrigorificos,
    todosFrigorificosLoja,
    todosFrigorificosCaminhao,
    notificacaoAtencaoFrigorifico
};