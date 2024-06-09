var database = require("../database/config");

// cadastro da frigorifico sem Loja
function cadastrarSemLoja(nome, tempMin, tempMax, fkTipo) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);

  // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
  //  e na ordem de inserção dos dados.
  var instrucaoSql = `
        INSERT INTO frigorifico (nome, temperatura_ideal_minima, temperatura_ideal_maxima, fkTipo) VALUES ('${nome}', ${tempMin}, ${tempMax}, ${fkTipo});
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

// cadastro da frigorifico com Loja
function cadastrarComLoja(nome, tempMin, tempMax, fkTipo) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);

  // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
  //  e na ordem de inserção dos dados.
  var instrucaoSql = `
        INSERT INTO frigorifico (nome, temperatura_ideal_minima, temperatura_ideal_maxima, fkTipo, fkLoja) VALUES ('${nome}', ${tempMin}, ${tempMax}, ${fkTipo}, ${fkLoja});
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
function pegarDadosFrigorifico(idFrigorifico) {
  console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);

  // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
  //  e na ordem de inserção dos dados.
  var instrucaoSql = `
    SELECT historicoFrigorifico.registrado_em dataRegistro, temperatura, temperatura_ideal_minima, temperatura_ideal_maxima FROM historicoFrigorifico JOIN sensor ON idSensor = fkSensor JOIN frigorifico ON idFrigorifico = fkFrigorifico WHERE idFrigorifico = ${idFrigorifico};
        `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
module.exports = {
  cadastrarSemLoja,
  cadastrarComLoja,
  pegarDadosFrigorifico,
};
