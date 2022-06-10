const express = require('express');
const { produtos, categorias } = require('./db/db.json');

const routes = express.Router();

routes.get('/', (req, res) => {
  res.status(200).send({
    message: "API Hello-World",
    mainRoute: "/",
    otherRoutes: "/produtos " + "/categorias"
  })
});

routes.get('/produtos', (req, res) => {
  res.status(200).send({ produtos })
});

routes.get('/categorias', (req, res) => {
  res.status(200).send({ categorias })
});

module.exports = routes;