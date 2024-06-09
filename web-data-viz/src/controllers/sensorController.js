var sensorModel = require("../models/sensorModel");
// var aquarioModel = require("../models/aquarioModel");

function cadastrar(req, res) {
  // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
  var fkFrigorifico = req.body.fkFrigorificoServer;

  // Faça as validações dos valores
  if (fkFrigorifico == undefined) {
    res.status(400).send("Seu fkFrigorifico está undefined!");
  } else {
    sensorModel
      .cadastrarSemLoja(fkFrigorifico)
      .then(function (resultado) {
        res.status(201).json(resultado);
      })
      .catch(function (erro) {
        console.log("\nHouve um erro ao realizar o cadastro! Erro: ", erro);
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  cadastrar,
};
