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

router.get("/tabelaDashDois_1", function (req, res) {
    usuarioController.tabelaDashDois_1(req, res);
});

router.post("/foraFaixa", function (req, res) {
    usuarioController.foraFaixa(req, res);
});

router.get("/graficoLoja1", function (req, res) {
    usuarioController.graficoLoja1(req, res);
});

router.get("/graficoLoja2", function (req, res) {
    usuarioController.graficoLoja2(req, res);
});

router.get("/graficoLoja3", function (req, res) {
    usuarioController.graficoLoja3(req, res);
});

router.get("/graficoLoja4", function (req, res) {
    usuarioController.graficoLoja4(req, res);
});

module.exports = router;
