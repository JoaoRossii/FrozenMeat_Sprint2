var database = require("../database/config")

function autenticar(cpfCnpj, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", cpfCnpj, senha)
    var instrucaoSql = `
        SELECT idUsuario, nome, email FROM usuario WHERE cpf_cnpj = '${cpfCnpj}' AND senha = '${senha}';
    `;
    var instrucaoSqlGer = `
        SELECT idUsuario, nome, email FROM usuario WHERE cpf_cnpj = '${cpfCnpj}' AND senha = '${senha} WHERE fkTipousuario = 2';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    if (database.executar(instrucaoSql) == true) {
        return database.executar(instrucaoSql);

    } else if (database.executar(instrucaoSqlGer) == true) {
        return database.executar(instrucaoSqlGer);

    } else {
        console.log("Erro ao efetuar o login, Verifique seus dados");
    }
    
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

module.exports = {
    autenticar,
    cadastrar
};