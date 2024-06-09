var express = require("express");
var router = express.Router();

var frigorificoController = require("../controllers/frigorificoController");

//Recebendo os dados do html e direcionando para a função cadastrar de frigorificoController.js
router.post("/cadastrar", function (req, res) {
    frigorificoController.cadastrar(req, res);
});

router.post("/pegarDadosFrigorifico", function (req, res) {
    frigorificoController.pegarDadosFrigorifico(req, res);
});

module.exports = router;
