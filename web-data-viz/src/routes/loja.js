var express = require("express");
var router = express.Router();

var lojaController = require("../controllers/lojaController");

//Recebendo os dados do html e direcionando para a função cadastrar de lojaController.js
router.post("/cadastrar", function (req, res) {
    lojaController.cadastrar(req, res);
});

module.exports = router;
