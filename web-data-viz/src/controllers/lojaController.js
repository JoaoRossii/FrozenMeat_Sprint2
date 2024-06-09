var lojaModel = require("../models/lojaModel");
// var aquarioModel = require("../models/aquarioModel");

function cadastrar(req, res) {
  // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
  var nomeLoja = req.body.nomeLojaServer;
  var fkEmpresa = req.body.fkEmpresaServer;

  // var nomeEmp = req.body.nomeEmpServer;
  // var cpfCnpj = req.body.cpfCnpjServer;
  // var gerente = req.body.gerenteServer;
  // var endereço = req.body.endereçoServer;
  // var senha = req.body.senhaServer;

  // Faça as validações dos valores
  if (nomeLoja == undefined) {
    res.status(400).send("O nome da loja está undefined!");
  }
  // } else if (cpfCnpj == undefined) {
  //     res.status(400).send("O CNPJ está undefined!");
  // } else if (gerente == undefined) {
  //     res.status(400).send("O gerente está undefined!");
  // } else if (endereço == undefined) {
  //     res.status(400).send("O endereço está undefined!");
  // } else if (senha == undefined) {
  //     res.status(400).send("A senha está undefined!");
  //
  else {
    if (fkEmpresa == undefined) {
      lojaModel
        .cadastrarSemEmpresa(nomeLoja)
        .then(function (resultado) {
          res.status(201).json(resultado);
        })
        .catch(function (erro) {
          console.log("\nHouve um erro ao realizar o cadastro! Erro: ", erro);
          res.status(500).json(erro.sqlMessage);
        });
    } else {
      lojaModel
        .cadastrarComEmpresa(nomeLoja, fkEmpresa)
        .then(function (resultado) {
          res.status(201).json(resultado);
        })
        .catch(function (erro) {
          console.log("\nHouve um erro ao realizar o cadastro! Erro: ", erro);
          res.status(500).json(erro.sqlMessage);
        });
    }
    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    // usuarioModel
    //   .cadastrar(nomeEmp, nomeLoja, cpfCnpj, gerente, endereço, senha)
    //   .then(function (resultado) {
    //     res.json(resultado);
    //   })
    //   .catch(function (erro) {
    //     console.log(erro);
    //     console.log(
    //       "\nHouve um erro ao realizar o cadastro! Erro: ",
    //       erro.sqlMessage
    //     );
    //     res.status(500).json(erro.sqlMessage);
    //   });
  }
}

module.exports = {
  cadastrar,
};
