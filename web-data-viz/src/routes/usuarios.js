var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.get("/todosFrigorificos", function (req, res) {
    usuarioController.todosFrigorificos(req, res);
});

router.get("/todosFrigorificosLoja", function (req, res) {
    usuarioController.todosFrigorificosLoja(req, res);
});

router.get("/todosFrigorificosCaminhao", function (req, res) {
    usuarioController.todosFrigorificosCaminhao(req, res);
});

router.get("/notificacaoAtencaoFrigorifico", function (req, res) {
    usuarioController.notificacaoAtencaoFrigorifico(req, res);
});

module.exports = router;