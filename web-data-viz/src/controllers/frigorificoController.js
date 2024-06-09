var frigorificoModel = require("../models/frigorificoModel");
// var aquarioModel = require("../models/aquarioModel");

function cadastrar(req, res) {
  // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
  var idFrigorifico = req.body.idFrigorificoServer;
  var tempMin = req.body.tempMinServer;
  var tempMax = req.body.tempMaxServer;
  var fkTipo = req.body.fkTipoServer;
  var fkLoja = req.body.fkLojaServer;

  // Faça as validações dos valores
  if (idFrigorifico == undefined) {
    res.status(400).send("Seu idFrigorifico está undefined!");
  } else if (tempMin == undefined) {
    res.status(400).send("Sua temperetura minima está undefined!");
  } else if (tempMax == undefined) {
    res.status(400).send("Sua temperatura maxima está undefined!");
  } else if (fkTipo == undefined) {
    res.status(400).send("Seu tipo de frigorifico está undefined!");
  } else {
    if (fkLoja == undefined) {
      frigorificoModel
        .cadastrarSemLoja(idFrigorifico, tempMin, tempMax, fkTipo)
        .then(function (resultado) {
          res.status(201).json(resultado);
        })
        .catch(function (erro) {
          console.log("\nHouve um erro ao realizar o cadastro! Erro: ", erro);
          res.status(500).json(erro.sqlMessage);
        });
    } else {
      frigorificoModel
        .cadastrarComLoja(idFrigorifico, tempMin, tempMax, fkTipo)
        .then(function (resultado) {
          res.status(201).json(resultado);
        })
        .catch(function (erro) {
          console.log("\nHouve um erro ao realizar o cadastro! Erro: ", erro);
          res.status(500).json(erro.sqlMessage);
        });
    }
  }
}

function pegarDadosFrigorifico(req, res) {
  // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
  var idFrigorifico = req.body.idFrigorificoServer;

  // Faça as validações dos valores
  if (idFrigorifico == undefined) {
    res.status(400).send("Seu idFrigorifico está undefined!");
  } else {
    frigorificoModel
      .pegarDadosFrigorifico(idFrigorifico)
      .then(function (resultado) {
        res.status(201).json(resultado);
      })
      .catch(function (erro) {
        console.log("\nHouve um erro ao pegar os dados! Erro: ", erro);
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  cadastrar,
  pegarDadosFrigorifico,
};
